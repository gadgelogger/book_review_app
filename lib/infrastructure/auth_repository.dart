import 'dart:async';

import 'package:book_review_app/exceptions/auth_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw _handleFirebaseAuthException(e);
    }
  }

  Future<void> signUpWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      // Firebase Authでのユーザー登録
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Firestoreにユーザー情報を保存
      final user = userCredential.user;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'name': name,
          'imageUrl': '', // 初期状態では空文字列やプレースホルダーのURL
          'bookCount': 0, // 初期状態での本の数は0
          'createdAt': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
        });
      }
    } on FirebaseAuthException catch (e) {
      throw _handleFirebaseAuthException(e);
    }
  }

  AuthException _handleFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return AuthException.weakPassword;
      case 'email-already-in-use':
        return AuthException.emailAlreadyInUse;
      case 'invalid-email':
        return AuthException.invalidEmail;
      case 'operation-not-allowed':
        return AuthException.operationNotAllowed;
      case 'user-disabled':
        return AuthException.userDisabled;
      case 'user-not-found':
        return AuthException.userNotFound;
      case 'wrong-password':
        return AuthException.wrongPassword;
      default:
        return AuthException.unknown;
    }
  }
}
