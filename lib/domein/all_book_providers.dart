//全ての本のを取得するためのprovider
import 'package:book_review_app/infrastructure/all_book_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allBooksProvider = StreamProvider((ref) {
  return ref.watch(bookRepositoryProvider).fetchAllBooks();
});

final bookRepositoryProvider =
    Provider((ref) => AllBookRepository(FirebaseFirestore.instance));
