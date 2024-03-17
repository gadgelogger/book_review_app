import 'dart:io';

import 'package:book_review_app/gen/book_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final bookRepositoryProvider = Provider(
  (ref) => BookRepository(
    FirebaseFirestore.instance,
    FirebaseStorage.instance,
    FirebaseAuth.instance,
  ),
);

class BookRepository {
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;
  final FirebaseAuth auth;
  BookRepository(this.firestore, this.storage, this.auth);

// BookRepositoryクラス内のaddBookメソッドを修正
  Future<void> addBook(
    BookData book,
    XFile? image,
  ) async {
    final userId = auth.currentUser?.uid;
    if (userId == null) {
      throw Exception('ユーザーが認証されていません。');
    }

    String? imageUrl;
    if (image != null) {
      final imagePath = 'users/$userId/books/${book.bookId}';
      final uploadTask = await storage.ref(imagePath).putFile(File(image.path));
      imageUrl = await uploadTask.ref.getDownloadURL();
    }

    final bookDataMap = book.toJson();
    bookDataMap.addAll({
      'imageUrl': imageUrl,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    });

    await firestore
        .collection('users/$userId/books')
        .doc(book.bookId)
        .set(bookDataMap);
  }
}
