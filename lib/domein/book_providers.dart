import 'package:book_review_app/controller/firebase_provider.dart';
import 'package:book_review_app/gen/book_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myBooksProvider = StreamProvider.autoDispose<List<BookData>>((ref) {
  final userId = ref.watch(uidProvider);
  return FirebaseFirestore.instance
      .collection('users/$userId/books')
      .orderBy('createdAt', descending: true)
      .snapshots()
      .map(
        (snapshot) =>
            snapshot.docs.map((doc) => BookData.fromJson(doc.data())).toList(),
      );
});
