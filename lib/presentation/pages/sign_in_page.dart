//サインイン画面
import 'package:book_review_app/exceptions/auth_exceptions.dart';
import 'package:book_review_app/infrastructure/auth_repository.dart';
import 'package:book_review_app/l10n/strings.g.dart';
import 'package:book_review_app/presentation/pages/main_page.dart';
import 'package:book_review_app/presentation/pages/sign_up_page.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  SignInPageState createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  final loginPageLabel = t.loginScreen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(loginPageLabel.title),
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
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: loginPageLabel.email,
                      ),
                    ),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: loginPageLabel.password,
                      ),
                      obscureText: true,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_emailController.text.isEmpty ||
                            _passwordController.text.isEmpty) {
                          _showErrorDialog('メールアドレスとパスワードを入力してください。');
                          return;
                        }

                        setState(() {
                          _isLoading = true;
                        });
                        try {
                          await AuthRepository().signInWithEmailAndPassword(
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
                          if (mounted) {
                            setState(() {
                              _isLoading = false;
                            });
                          }
                        }
                      },
                      child: Text(loginPageLabel.login),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) {
                              return const SignUpPage();
                            },
                          ),
                        );
                      },
                      child: Text(loginPageLabel.register),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
