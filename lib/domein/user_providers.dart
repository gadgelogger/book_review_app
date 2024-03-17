import 'package:book_review_app/gen/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userStreamProvider = StreamProvider<UserData>((ref) {
  final userId = FirebaseAuth.instance.currentUser?.uid;
  if (userId == null) {
    return Stream.error('ユーザーが見つかりません。');
  }
  return FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .snapshots()
      .map((snapshot) {
    final data = snapshot.data();
    if (data == null) throw Exception('ユーザーデータが存在しません。');
    return UserData.fromJson(data);
  });
});
