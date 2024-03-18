import 'dart:io';

import 'package:book_review_app/gen/book_data.dart';
import 'package:book_review_app/infrastructure/book_repository.dart';
import 'package:book_review_app/l10n/strings.g.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class PostBook extends ConsumerWidget {
  const PostBook({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postBookPopupLabel = t.addBookPopup;
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
                uid: FirebaseAuth.instance.currentUser!.uid,
                banned: false,
                email: FirebaseAuth.instance.currentUser!.email!,
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
          title: Text(postBookPopupLabel.title, textAlign: TextAlign.center),
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
                  decoration: InputDecoration(
                    labelText: postBookPopupLabel.name,
                  ),
                ),
                TextField(
                  controller: urlController,
                  decoration: InputDecoration(
                    labelText: postBookPopupLabel.url,
                  ),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: postBookPopupLabel.description,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(postBookPopupLabel.cancel),
            ),
            TextButton(
              onPressed: postBook,
              child: Text(postBookPopupLabel.add),
            ),
          ],
        ),
      ),
      child: const Icon(Icons.add),
    );
  }
}
