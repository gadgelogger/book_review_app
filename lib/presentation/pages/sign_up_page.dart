import 'package:book_review_app/exceptions/auth_exceptions.dart';
import 'package:book_review_app/infrastructure/auth_repository.dart';
import 'package:book_review_app/presentation/pages/main_page.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新規登録'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: _isLoading
              ? const CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: '名前',
                      ),
                    ),
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'メールアドレス',
                      ),
                    ),
                    TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'パスワード',
                      ),
                      obscureText: true,
                    ),
                    TextField(
                      controller: _passwordConfirmController,
                      decoration: const InputDecoration(
                        labelText: 'パスワード（確認）',
                      ),
                      obscureText: true,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_passwordController.text !=
                            _passwordConfirmController.text) {
                          _showErrorDialog('パスワードが一致しません。');
                          return;
                        }
                        setState(() {
                          _isLoading = true;
                        });
                        try {
                          await AuthRepository().signUpWithEmailAndPassword(
                            _emailController.text,
                            _passwordController.text,
                          );
                          await Navigator.of(context).pushReplacement(
                            MaterialPageRoute<void>(
                              builder: (context) => MainPage(),
                            ),
                          );
                        } on AuthException catch (e) {
                          _showErrorDialog(e.message);
                        } finally {
                          setState(() {
                            _isLoading = false;
                          });
                        }
                      },
                      child: const Text('登録'),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  void _showErrorDialog(String message) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('エラー'),
        content: Text(message),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
