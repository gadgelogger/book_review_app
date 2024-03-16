import 'dart:async';

import 'package:book_review_app/exceptions/auth_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
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
