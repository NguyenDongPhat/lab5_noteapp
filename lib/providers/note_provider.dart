import 'package:flutter/material.dart';
import '../database/db_helper.dart';
import '../models/note.dart';

// Định nghĩa các kiểu sắp xếp
enum SortOption { dateDesc, dateAsc, titleAsc, titleDesc }

class NoteProvider extends ChangeNotifier {
  List<Note> _notes = [];
  String _searchQuery = '';
  SortOption _sortOption = SortOption.dateDesc;

  // Lấy danh sách ghi chú (Đã qua Lọc & Sắp xếp)
  List<Note> get notes {
    // 1. Lọc theo tìm kiếm
    List<Note> filteredNotes = _notes.where((note) {
      return note.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
             note.content.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    // 2. Sắp xếp
    switch (_sortOption) {
      case SortOption.dateAsc:
        filteredNotes.sort((a, b) => a.updatedAt.compareTo(b.updatedAt));
        break;
      case SortOption.titleAsc:
        filteredNotes.sort((a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));
        break;
      case SortOption.titleDesc:
        filteredNotes.sort((a, b) => b.title.toLowerCase().compareTo(a.title.toLowerCase()));
        break;
      case SortOption.dateDesc:
      default:
        filteredNotes.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
        break;
    }
    return filteredNotes;
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void setSortOption(SortOption option) {
    _sortOption = option;
    notifyListeners();
  }

  Future<void> loadNotes() async {
    _notes = await DatabaseHelper.instance.readAll();
    notifyListeners();
  }

  Future<void> addNote(Note note) async {
    await DatabaseHelper.instance.create(note);
    await loadNotes();
  }

  Future<void> updateNote(Note note) async {
    await DatabaseHelper.instance.update(note);
    await loadNotes();
  }

  Future<void> deleteNote(int id) async {
    await DatabaseHelper.instance.delete(id);
    await loadNotes();
  }
}