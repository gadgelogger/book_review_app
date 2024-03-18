import 'package:book_review_app/gen/all_book_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AllBookRepository {
  final FirebaseFirestore firestore;
  AllBookRepository(this.firestore);

  Stream<List<AllBookData>> fetchAllBooks() {
    return firestore
        .collection('allUsersBooks')
        .snapshots()
        .asyncMap((snapshot) async {
      final books = await Future.wait(
        snapshot.docs.map((doc) async {
          final data = doc.data();
          final book = AllBookData.fromJson(data);

          final userDoc =
              await firestore.collection('users').doc(book.uid).get();
          final userName = userDoc.data()?['name'] as String?;

          return book.copyWith(userName: userName);
        }),
      );

      return books;
    });
  }
}
