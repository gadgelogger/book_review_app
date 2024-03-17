import 'package:book_review_app/domein/user_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class MyPageEdit extends ConsumerWidget {
  final ImagePicker _picker = ImagePicker();
  MyPageEdit({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDataAsyncValue = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('プロフィール編集'),
      ),
      body: userDataAsyncValue.when(
        data: (userData) {
          // TextEditingControllerはここで初期化することで、userDataが確実に利用可能な状態であることを保証します。
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
                        // 画像をアップロードし、URLを取得してユーザーデータを更新
                      }
                    },
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: userData.imageUrl != null &&
                              userData.imageUrl!.isNotEmpty
                          ? NetworkImage(userData.imageUrl!)
                          : null,
                      child: userData.imageUrl == null ||
                              userData.imageUrl!.isEmpty
                          ? const Icon(Icons.camera_alt, size: 60)
                          : null,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: '名前'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // ユーザーデータを更新
                    },
                    child: const Text('更新'),
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
