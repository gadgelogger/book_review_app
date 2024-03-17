import 'dart:io';

import 'package:book_review_app/gen/book_data.dart';
import 'package:book_review_app/infrastructure/book_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class PostBook extends ConsumerWidget {
  const PostBook({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final picker = ImagePicker();
    XFile? pickedImage;
    final titleController = TextEditingController();
    final urlController = TextEditingController();
    final descriptionController = TextEditingController();

    Future<void> pickImage() async {
      final image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        pickedImage = image;
      }
    }

    Future<void> postBook() async {
      if (titleController.text.isNotEmpty &&
          descriptionController.text.isNotEmpty) {
        final bookId = FirebaseFirestore.instance
            .collection('users/${FirebaseAuth.instance.currentUser?.uid}/books')
            .doc()
            .id;

        await ref.read(bookRepositoryProvider).addBook(
              BookData(
                title: titleController.text,
                description: descriptionController.text,
                url: urlController.text,
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
                bookId: bookId,
              ),
              pickedImage,
            );

        titleController.clear();
        urlController.clear();
        descriptionController.clear();
        pickedImage = null;
        Navigator.of(context).pop();
      }
    }

    return FloatingActionButton(
      onPressed: () => showDialog<void>(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('本を追加', textAlign: TextAlign.center),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: pickImage,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: pickedImage != null
                        ? FileImage(File(pickedImage!.path))
                        : null,
                    child: pickedImage == null
                        ? const Icon(Icons.add_photo_alternate, size: 60)
                        : null,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'タイトル',
                    hintText: '本のタイトルを入力してください',
                  ),
                ),
                TextField(
                  controller: urlController,
                  decoration: const InputDecoration(
                    labelText: 'URL',
                    hintText: '本のURLを入力してください',
                  ),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    labelText: '説明',
                    hintText: '本の説明を入力してください',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('キャンセル'),
            ),
            TextButton(
              onPressed: postBook,
              child: const Text('追加'),
            ),
          ],
        ),
      ),
      child: const Icon(Icons.add),
    );
  }
}
