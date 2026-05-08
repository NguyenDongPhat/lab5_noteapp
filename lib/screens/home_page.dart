import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/note_provider.dart';
import '../models/note.dart';
import '../widgets/note_card.dart';
import 'note_editor_screen.dart';
import '../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // Biến cho Chọn Nhiều
  bool _isSelectionMode = false;
  final Set<int> _selectedIds = {};
  
  // Biến cho Tìm Kiếm
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NoteProvider>(context, listen: false).loadNotes();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _editNote(Note? note) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => NoteEditorScreen(note: note)));
  }

  void _toggleSelection(int id) {
    setState(() {
      if (_selectedIds.contains(id)) {
        _selectedIds.remove(id);
        if (_selectedIds.isEmpty) _isSelectionMode = false;
      } else {
        _selectedIds.add(id);
      }
    });
  }

  void _deleteSelectedNotes() {
    final provider = Provider.of<NoteProvider>(context, listen: false);
    final notesToDelete = provider.notes.where((n) => _selectedIds.contains(n.id)).toList();
    final count = notesToDelete.length;
    if (count == 0) return;

    setState(() {
      _isSelectionMode = false;
      _selectedIds.clear();
    });

    for (var note in notesToDelete) {
      provider.deleteNote(note.id!);
    }

    globalMessengerKey.currentState?.clearSnackBars();
    globalMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: CountdownSnackBar(message: 'Đã xóa $count ghi chú'),
        duration: const Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'HOÀN TÁC',
          textColor: Colors.orangeAccent,
          onPressed: () {
            for (var note in notesToDelete) {
              provider.addNote(note);
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isSelectionMode
          ? AppBar(
              leading: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _isSelectionMode = false;
                    _selectedIds.clear();
                  });
                },
              ),
              title: Text('${_selectedIds.length} mục đã chọn'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.delete_sweep, color: Colors.white),
                  onPressed: _deleteSelectedNotes,
                ),
              ],
            )
          : AppBar(
              title: _isSearching
                  ? TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: 'Tìm kiếm...',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.white70),
                      ),
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                      autofocus: true,
                      cursorColor: Colors.white,
                      onChanged: (value) {
                        Provider.of<NoteProvider>(context, listen: false).setSearchQuery(value);
                      },
                    )
                  : const Text('Ghi chú của tôi'),
              actions: [
                // Nút Bật/Tắt tìm kiếm
                IconButton(
                  icon: Icon(_isSearching ? Icons.close : Icons.search),
                  onPressed: () {
                    setState(() {
                      _isSearching = !_isSearching;
                      if (!_isSearching) {
                        _searchController.clear();
                        Provider.of<NoteProvider>(context, listen: false).setSearchQuery('');
                      }
                    });
                  },
                ),
                // Nút Sắp xếp (Chỉ hiện khi không tìm kiếm cho đỡ rối)
                if (!_isSearching)
                  PopupMenuButton<SortOption>(
                    icon: const Icon(Icons.sort),
                    onSelected: (SortOption result) {
                      Provider.of<NoteProvider>(context, listen: false).setSortOption(result);
                    },
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<SortOption>>[
                      const PopupMenuItem<SortOption>(value: SortOption.dateDesc, child: Text('Mới nhất')),
                      const PopupMenuItem<SortOption>(value: SortOption.dateAsc, child: Text('Cũ nhất')),
                      const PopupMenuItem<SortOption>(value: SortOption.titleAsc, child: Text('Tên A-Z')),
                      const PopupMenuItem<SortOption>(value: SortOption.titleDesc, child: Text('Tên Z-A')),
                    ],
                  ),
              ],
            ),
      body: SizedBox.expand(
        child: Consumer<NoteProvider>(
          builder: (context, provider, child) {
            if (provider.notes.isEmpty) {
              return Center(child: Text(_isSearching ? 'Không tìm thấy kết quả.' : 'Chưa có ghi chú nào.'));
            }
            return ListView.builder(
              itemCount: provider.notes.length,
              itemBuilder: (context, index) {
                final note = provider.notes[index];
                final isSelected = _selectedIds.contains(note.id);

                return NoteCard(
                  note: note,
                  isSelected: isSelected,
                  isSelectionMode: _isSelectionMode,
                  onTap: () {
                    if (_isSelectionMode) {
                      _toggleSelection(note.id!);
                    } else {
                      _editNote(note);
                    }
                  },
                  onLongPress: () {
                    if (!_isSelectionMode) {
                      setState(() {
                        _isSelectionMode = true;
                        _selectedIds.add(note.id!);
                      });
                    }
                  },
                  onEdit: () => _editNote(note),
                  onDelete: () {
                    provider.deleteNote(note.id!);
                    globalMessengerKey.currentState?.clearSnackBars();
                    globalMessengerKey.currentState?.showSnackBar(
                      SnackBar(
                        content: CountdownSnackBar(message: 'Đã đưa ghi chú vào thùng rác'),
                        duration: const Duration(seconds: 5),
                        behavior: SnackBarBehavior.floating,
                        action: SnackBarAction(
                          label: 'HOÀN TÁC',
                          textColor: Colors.orangeAccent,
                          onPressed: () => provider.addNote(note),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: _isSelectionMode
          ? null
          : FloatingActionButton(
              onPressed: () => _editNote(null),
              child: const Icon(Icons.add),
            ),
    );
  }
}

class CountdownSnackBar extends StatefulWidget {
  final String message;
  const CountdownSnackBar({super.key, required this.message});

  @override
  State<CountdownSnackBar> createState() => _CountdownSnackBarState();
}

class _CountdownSnackBarState extends State<CountdownSnackBar> {
  late DateTime _endTime;
  int _timeLeft = 5;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _endTime = DateTime.now().add(const Duration(seconds: 5));
    _timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      final now = DateTime.now();
      final remaining = _endTime.difference(now).inSeconds;

      if (remaining <= 0) {
        _timer?.cancel();
        if (mounted) {
          setState(() => _timeLeft = 0);
          globalMessengerKey.currentState?.hideCurrentSnackBar();
        }
      } else {
        if (mounted && _timeLeft != remaining) {
          setState(() => _timeLeft = remaining);
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text('${widget.message} (còn $_timeLeft s)');
  }
}