// book_repository.dart
import 'package:book_review_app/gen/all_book_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AllBookRepository {
  final FirebaseFirestore firestore;
  AllBookRepository(this.firestore);

  Stream<List<AllBookData>> fetchAllBooks() {
    return firestore.collection('allUsersBooks').snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => AllBookData.fromJson(doc.data()))
              .toList(),
        );
  }
}
