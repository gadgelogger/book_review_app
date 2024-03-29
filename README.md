# BookReview_Readme

## スクリーンショット
| 全ユーザー投稿一覧(light) | 全ユーザー投稿一覧(dark) |
|:-:|:-:|
|![Simulator Screenshot - iPhone 15 Pro - 2024-03-21 at 19 18 14](https://github.com/gadgelogger/book_review_app/assets/39609331/472c4acc-9559-441f-8d42-85c83da27fcf)|![Simulator Screenshot - iPhone 15 Pro - 2024-03-21 at 19 18 22](https://github.com/gadgelogger/book_review_app/assets/39609331/376a5ca8-7f07-4ae8-afca-960b35ee207f)|

| 自分の投稿一覧(light) | 自分の投稿一覧(dark) |
|:-:|:-:|
|![Simulator Screenshot - iPhone 15 Pro - 2024-03-21 at 19 19 23](https://github.com/gadgelogger/book_review_app/assets/39609331/3ab60ef1-c77c-4251-b57e-07d783ce3713)|![Simulator Screenshot - iPhone 15 Pro - 2024-03-21 at 19 19 27](https://github.com/gadgelogger/book_review_app/assets/39609331/38c59b08-6dcc-411f-862a-205d3f34e625)|
| ログイン画面 | 登録画面 |
|:-:|:-:|
|![Simulator Screenshot - iPhone 15 Pro - 2024-03-21 at 19 20 41](https://github.com/gadgelogger/book_review_app/assets/39609331/437c0957-b87c-42fc-ae4c-9702c808d057)|![Simulator Screenshot - iPhone 15 Pro - 2024-03-21 at 19 20 44](https://github.com/gadgelogger/book_review_app/assets/39609331/81a7df9d-59cd-4dca-b245-422ba5881907)|

| アカウントページ | アカウントページ編集 |
|:-:|:-:|
|![Simulator Screenshot - iPhone 15 Pro - 2024-03-21 at 19 19 34](https://github.com/gadgelogger/book_review_app/assets/39609331/55923808-e4fa-4774-af55-ac3aa5380c26)|![Simulator Screenshot - iPhone 15 Pro - 2024-03-21 at 19 19 45](https://github.com/gadgelogger/book_review_app/assets/39609331/6e55f7e4-e62f-43b1-99d8-28be5617c8cd)|


| データなし | エラー | 設定画面 |
|:-:|:-:|:-:|
|![Simulator Screenshot - iPhone 15 Pro - 2024-03-21 at 19 18 28](https://github.com/gadgelogger/book_review_app/assets/39609331/c0119d6e-9da3-4779-9f10-195e00b8e3ae)|![image](https://github.com/gadgelogger/book_review_app/assets/39609331/c1409a49-deb4-4533-b349-73020e8883d9)|![Simulator Screenshot - iPhone 15 Pro - 2024-03-21 at 19 19 39](https://github.com/gadgelogger/book_review_app/assets/39609331/4fea4c04-244d-4a51-ab90-1eea675e4837)|


#### demo



https://github.com/gadgelogger/book_review_app/assets/39609331/d58cb6c9-a096-4da2-ba09-370d9a5a7f54



### 動作
- Firebaseとデータの送受信を行う。

### UI/UX
- エラー発生時の処理
- ダークモードの対応
- 多言語対応（英語、日本語）
# 環境
-  IDE:Visual Studio Code 1.87.2
-  Flutter: 3.19.3
-  Dart: 3.3.0
-  サポートするプラットフォーム: iOS/Android
# 状態管理
flutter_riverpod:^2.5.1
# 使用技術とパッケージ
```
name: book_review_app
description: "A new Flutter project."
publish_to: 'none'
version: 0.1.0

environment:
  sdk: '>=3.3.0 <4.0.0'

dependencies:
  cloud_firestore: ^4.15.9
  firebase_auth: ^4.17.9
  firebase_core: ^2.27.1
  firebase_storage: ^11.6.10
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter  
  flutter_gen_runner: ^5.4.0
  flutter_launcher_icons: ^0.13.1
  flutter_riverpod: ^2.5.1
  freezed_annotation: ^2.4.1
  image_picker: ^1.0.7
  intl: ^0.18.1
  json_annotation: ^4.8.1
  riverpod_annotation: ^2.3.5
  settings_ui: ^2.0.2
  shared_preferences: ^2.2.2
  slang: ^3.29.0
  slang_flutter: ^3.29.0


dev_dependencies:
  flutter_test:
    sdk: flutter
  riverpod_generator: ^2.4.0
  build_runner: ^2.4.8
  custom_lint: ^0.6.2
  riverpod_lint: ^2.3.10
  pedantic_mono: any
  freezed: ^2.4.7
  json_serializable: ^6.7.1
  slang_build_runner: ^3.29.0

flutter:
  uses-material-design: true
  assets:
    - assets/

flutter_icons:
  ios: true
  remove_alpha_ios: true
  image_path: "assets/app_icon.jpeg"

```



# フォルダ構成
```
├── lib
│   ├── controller
│   │   ├── firebase_provider.dart
│   │   └── firebase_provider.g.dart
│   ├── domein
│   │   ├── all_book_providers.dart
│   │   ├── book_providers.dart
│   │   ├── share_preferences_instance.dart
│   │   ├── theme_mode_provider.dart
│   │   └── user_providers.dart
│   ├── exceptions
│   │   ├── auth_exceptions.dart
│   │   └── date_time_timestamp_converter.dart
│   ├── firebase_options.dart
│   ├── gen
│   │   ├── all_book_data.dart
│   │   ├── all_book_data.freezed.dart
│   │   ├── all_book_data.g.dart
│   │   ├── assets.gen.dart
│   │   ├── book_data.dart
│   │   ├── book_data.freezed.dart
│   │   ├── book_data.g.dart
│   │   ├── user_data.dart
│   │   ├── user_data.freezed.dart
│   │   └── user_data.g.dart
│   ├── infrastructure
│   │   ├── all_book_repository.dart
│   │   ├── auth_repository.dart
│   │   ├── book_repository.dart
│   │   └── user_repository.dart
│   ├── l10n
│   │   ├── strings.g.dart
│   │   ├── strings.i18n.json
│   │   └── strings_ja.i18n.json
│   ├── main.dart
│   ├── presentation
│   │   ├── pages
│   │   ├── res
│   │   └── widgets
│   └── utils

```
# ビルド手順（※メモ）


- リポジトリのクローン
```
$ git clone https://github.com/gadgelogger/book_review_app.git
```
- Dartのインストール
```
$ brew tap dart-lang/dart
$ brew install dart
```
- fvmをインストール
```
$ dart pub global activate fvm
```
- fvmへのパスを通す
```
export PATH="$PATH":"$HOME/.pub-cache/bin"
```
- fvmのインストール確認
```
$ fvm --version
3.0.1
```


- ディレクトリへ移動
```
$ cd book_review_app
```

- fvm読み込み
```
$ fvm install
```

- 依存関係を読み込む
```
$ fvm flutter pub get
```

- freezedなどのコード生成
```
$ fvm dart run build_runner build -d

```

- ビルドラン
```
$ fvm flutter run
```


# Note
- コードの可読性を重視して、Widgetを分割しました。
- シンプルかつスタイリッシュなデザインを意識しました。
- さまざまな方に使ってもらいたい気持ちがあるため多言語対応をしました。
# 感想、難しかったところ
- RiverPodを使い方をtodoアプリと兼ね備えてある程度使えるようになった。
- riverpod generator・Freezedなどコード自動生成のツールがいかに便利かがよくわかった。（これ個人開発に導入しよう）
- 初めてCloudFunctionを使ってみたが、使いこなすと非常に便利だなと思った。
# コレから実装したい機能（間に合わなかったところ）
- 中級の範囲に入ってしまうが、自分の投稿したデータにコメントをつけることができるようにしたい。（コメント用のモデル作ってサブコレクションにデータを書き込むようにすれば比較的すぐにできそう）
- いいね機能などもつけてみたい
- また自分の投稿にコメントやいいねが来た場合、CloudFunctionとMessagingを使って通知が来るようにしても良さそう

# 帰属表示
アプリのアイコンには[Lordicon](https://lordicon.com/)を使用しました。

