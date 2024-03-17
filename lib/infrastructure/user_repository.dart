// infrastructure/user_repository.dart
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository(FirebaseFirestore.instance, FirebaseStorage.instance);
});

class UserRepository {
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;
  UserRepository(this.firestore, this.storage);

  Future<void> updateUser(
    String userId, {
    String? name,
    String? imageUrl,
  }) async {
    final docRef = firestore.collection('users').doc(userId);
    final updateData = <String, dynamic>{};
    if (name != null) {
      updateData['name'] = name;
    }
    if (imageUrl != null) {
      updateData['imageUrl'] = imageUrl;
    }
    await docRef.update(updateData);
  }

  Future<String?> uploadProfileImage(XFile image) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      return null;
    }

    final imagePath = 'profile_images/$userId';
    final storageRef = storage.ref().child(imagePath);
    final uploadTask = await storageRef.putFile(File(image.path));
    final imageUrl = await uploadTask.ref.getDownloadURL();
    return imageUrl;
  }
}
