//サインアップ画面
import 'package:book_review_app/exceptions/auth_exceptions.dart';
import 'package:book_review_app/infrastructure/auth_repository.dart';
import 'package:book_review_app/l10n/strings.g.dart';
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
  final signUpPageLabel = t.signUpScreen;
  final errorLabel = t.error;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(signUpPageLabel.title),
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
                      decoration: InputDecoration(
                        labelText: signUpPageLabel.name,
                      ),
                    ),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: signUpPageLabel.email,
                      ),
                    ),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: signUpPageLabel.password,
                      ),
                      obscureText: true,
                    ),
                    TextField(
                      controller: _passwordConfirmController,
                      decoration: InputDecoration(
                        labelText: signUpPageLabel.confirmPassword,
                      ),
                      obscureText: true,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        // 名前、メールアドレス、パスワードが空かチェック
                        if (_nameController.text.isEmpty ||
                            _emailController.text.isEmpty ||
                            _passwordController.text.isEmpty ||
                            _passwordConfirmController.text.isEmpty) {
                          _showErrorDialog('すべてのフィールドを入力してください。');
                          return;
                        }
                        // パスワードとパスワード確認が一致するかチェック
                        if (_passwordController.text !=
                            _passwordConfirmController.text) {
                          _showErrorDialog(errorLabel.passwordNotMatch);
                          return;
                        }

                        setState(() {
                          _isLoading = true;
                        });
                        try {
                          await AuthRepository().signUpWithEmailAndPassword(
                            _emailController.text,
                            _passwordController.text,
                            _nameController.text,
                          );

                          await Navigator.of(context).pushReplacement(
                            MaterialPageRoute<void>(
                              builder: (context) => MainPage(),
                            ),
                          );
                        } on AuthException catch (e) {
                          _showErrorDialog(e.message);
                        } finally {
                          if (mounted) {
                            setState(() {
                              _isLoading = false;
                            });
                          }
                        }
                      },
                      child: Text(signUpPageLabel.register),
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
