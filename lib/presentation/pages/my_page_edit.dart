import 'package:book_review_app/domein/user_providers.dart';
import 'package:book_review_app/infrastructure/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class MyPageEdit extends ConsumerWidget {
  final ImagePicker _picker = ImagePicker();
  MyPageEdit({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDataAsyncValue = ref.watch(userStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('プロフィール編集'),
      ),
      body: userDataAsyncValue.when(
        data: (userData) {
          final nameController = TextEditingController(text: userData.name);
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      final image =
                          await _picker.pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        final imageUrl = await ref
                            .read(userRepositoryProvider)
                            .uploadProfileImage(image);
                        if (imageUrl != null) {
                          await ref
                              .read(userRepositoryProvider)
                              .updateUser(userData.uid, imageUrl: imageUrl);
                          // Success feedback
                        }
                      }
                    },
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: userData.imageUrl != null
                          ? NetworkImage(userData.imageUrl!)
                          : null,
                      child: userData.imageUrl == ''
                          ? const Icon(Icons.person, size: 100)
                          : null,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(controller: nameController),
                  ElevatedButton(
                    onPressed: () async {
                      await ref
                          .read(userRepositoryProvider)
                          .updateUser(userData.uid, name: nameController.text);
                      Navigator.of(context).pop();
                    },
                    child: const Text('名前を更新'),
                  ),
                ],
              ),
            ),
          );
        },
        loading: () => const CircularProgressIndicator(),
        error: (error, stack) => Text('エラー: $error'),
      ),
    );
  }
}
