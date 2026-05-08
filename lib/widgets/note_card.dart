import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/note.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final bool isSelected;      // Thẻ có đang được chọn không?
  final bool isSelectionMode; // App có đang ở chế độ chọn nhiều không?
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const NoteCard({
    super.key,
    required this.note,
    required this.isSelected,
    required this.isSelectionMode,
    required this.onTap,
    required this.onLongPress,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isSelected ? const Color(0xFFFFE0B2) : Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: isSelected ? 4 : 0, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: isSelected 
              ? Colors.orangeAccent 
              : Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
          width: isSelected ? 2 : 1.2,
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8),
        onTap: onTap,
        onLongPress: onLongPress,
        title: Text(
          note.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              note.content,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Text(
              'Cập nhật: ${DateFormat('dd/MM/yyyy HH:mm').format(note.updatedAt)}',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        trailing: isSelectionMode
            ? Checkbox(
                value: isSelected,
                onChanged: (_) => onTap(), 
                activeColor: const Color(0xFFFFB703),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit_outlined, color: Theme.of(context).colorScheme.primary),
                    tooltip: 'Sửa ghi chú',
                    onPressed: onEdit,
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                    tooltip: 'Xóa ghi chú',
                    onPressed: onDelete,
                  ),
                ],
              ),
      ),
    );
  }
}