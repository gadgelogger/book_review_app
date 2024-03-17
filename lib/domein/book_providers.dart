import 'package:book_review_app/gen/book_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myBooksProvider = StreamProvider.autoDispose<List<BookData>>((ref) {
  final userId = FirebaseAuth.instance.currentUser?.uid;
  if (userId == null) {
    throw Exception('ユーザーが認証されていません。');
  }
  return FirebaseFirestore.instance
      .collection('users/$userId/books')
      .orderBy('createdAt', descending: true)
      .snapshots()
      .map(
        (snapshot) =>
            snapshot.docs.map((doc) => BookData.fromJson(doc.data())).toList(),
      );
});
