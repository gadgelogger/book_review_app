enum AuthException {
  weakPassword,
  emailAlreadyInUse,
  invalidEmail,
  operationNotAllowed,
  userDisabled,
  userNotFound,
  wrongPassword,
  unknown,
}

extension AuthExceptionExtension on AuthException {
  String get message {
    switch (this) {
      case AuthException.weakPassword:
        return 'パスワードが弱すぎます。';
      case AuthException.emailAlreadyInUse:
        return 'このメールアドレスは既に使用されています。';
      case AuthException.invalidEmail:
        return 'メールアドレスが無効です。';
      case AuthException.operationNotAllowed:
        return 'この操作は許可されていません。';
      case AuthException.userDisabled:
        return 'このユーザーは無効化されています。';
      case AuthException.userNotFound:
        return 'ユーザーが見つかりませんでした。';
      case AuthException.wrongPassword:
        return 'パスワードが間違っています。';
      case AuthException.unknown:
        return '不明なエラーが発生しました。';
    }
  }
}
