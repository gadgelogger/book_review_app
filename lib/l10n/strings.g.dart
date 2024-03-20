/// Generated file. Do not edit.
///
/// Original: lib/l10n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 108 (54 per locale)
///
/// Built on 2024-03-20 at 15:49 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	ja(languageCode: 'ja', build: _StringsJa.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final _StringsLoginScreenEn loginScreen = _StringsLoginScreenEn._(_root);
	late final _StringsSignUpScreenEn signUpScreen = _StringsSignUpScreenEn._(_root);
	late final _StringsSettingScreenEn settingScreen = _StringsSettingScreenEn._(_root);
	late final _StringsHomeScreenEn homeScreen = _StringsHomeScreenEn._(_root);
	late final _StringsBooksScreenEn booksScreen = _StringsBooksScreenEn._(_root);
	late final _StringsAddBookPopupEn addBookPopup = _StringsAddBookPopupEn._(_root);
	late final _StringsMyPageScreenEn myPageScreen = _StringsMyPageScreenEn._(_root);
	late final _StringsMyPageEditScreenEn myPageEditScreen = _StringsMyPageEditScreenEn._(_root);
	late final _StringsBottomNavigationEn bottomNavigation = _StringsBottomNavigationEn._(_root);
	late final _StringsErrorEn error = _StringsErrorEn._(_root);
	Map<String, String> get locales => {
		'en': 'English',
		'ja': 'Japanese',
	};
}

// Path: loginScreen
class _StringsLoginScreenEn {
	_StringsLoginScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Sign In';
	String get email => 'Email Address';
	String get password => 'Password';
	String get login => 'Sign In';
	String get register => 'Register here';
}

// Path: signUpScreen
class _StringsSignUpScreenEn {
	_StringsSignUpScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Register';
	String get name => 'Name';
	String get email => 'Email Address';
	String get password => 'Password';
	String get confirmPassword => 'Confirm Password';
	String get register => 'Register';
}

// Path: settingScreen
class _StringsSettingScreenEn {
	_StringsSettingScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Settings';
	String get themeTitle => 'Color Scheme';
	String get theme => 'Theme';
	String get accountTitle => 'Account Related';
	String get logout => 'Log Out';
}

// Path: homeScreen
class _StringsHomeScreenEn {
	_StringsHomeScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Home';
	String get text => 'Let\'s add a book';
}

// Path: booksScreen
class _StringsBooksScreenEn {
	_StringsBooksScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Bookshelf';
	String get text => 'Let\'s add a book';
}

// Path: addBookPopup
class _StringsAddBookPopupEn {
	_StringsAddBookPopupEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Added a book';
	String get name => 'Title';
	String get url => 'url';
	String get description => 'Description';
	String get cancel => 'Cancel';
	String get add => 'Add';
}

// Path: myPageScreen
class _StringsMyPageScreenEn {
	_StringsMyPageScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'My Page';
	String get bookCount => 'Number of Books';
	String get count => '';
	String get editBunnton => 'Edit';
}

// Path: myPageEditScreen
class _StringsMyPageEditScreenEn {
	_StringsMyPageEditScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Edit Profile';
	String get save => 'Save';
}

// Path: bottomNavigation
class _StringsBottomNavigationEn {
	_StringsBottomNavigationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get home => 'Home';
	String get books => 'Bookshelf';
	String get myPage => 'My Page';
}

// Path: error
class _StringsErrorEn {
	_StringsErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get email => 'Please enter your email address';
	String get password => 'Please enter your password';
	String get confirmPassword => 'Please confirm your password';
	String get passwordNotMatch => 'Passwords do not match';
	String get name => 'Please enter your name';
	String get emailFormat => 'Email format is incorrect';
	String get passwordLength => 'Password must be at least 6 characters';
	String get emailExist => 'This email is already registered';
	String get loginFailed => 'Failed to sign in';
	String get registerFailed => 'Failed to register';
	String get logoutFailed => 'Failed to log out';
	String get fetchFailed => 'Failed to fetch data';
	String get updateFailed => 'Failed to update data';
	String get deleteFailed => 'Failed to delete data';
	String get noData => 'No data available';
	String get noConnection => 'Please connect to the internet';
	String get unknown => 'An error occurred';
}

// Path: <root>
class _StringsJa implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsJa.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsJa _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsLoginScreenJa loginScreen = _StringsLoginScreenJa._(_root);
	@override late final _StringsSignUpScreenJa signUpScreen = _StringsSignUpScreenJa._(_root);
	@override late final _StringsSettingScreenJa settingScreen = _StringsSettingScreenJa._(_root);
	@override late final _StringsHomeScreenJa homeScreen = _StringsHomeScreenJa._(_root);
	@override late final _StringsBooksScreenJa booksScreen = _StringsBooksScreenJa._(_root);
	@override late final _StringsAddBookPopupJa addBookPopup = _StringsAddBookPopupJa._(_root);
	@override late final _StringsMyPageScreenJa myPageScreen = _StringsMyPageScreenJa._(_root);
	@override late final _StringsMyPageEditScreenJa myPageEditScreen = _StringsMyPageEditScreenJa._(_root);
	@override late final _StringsBottomNavigationJa bottomNavigation = _StringsBottomNavigationJa._(_root);
	@override late final _StringsErrorJa error = _StringsErrorJa._(_root);
	@override Map<String, String> get locales => {
		'en': '英語',
		'ja': '日本語',
	};
}

// Path: loginScreen
class _StringsLoginScreenJa implements _StringsLoginScreenEn {
	_StringsLoginScreenJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'サインイン';
	@override String get email => 'メールアドレス';
	@override String get password => 'パスワード';
	@override String get login => 'サインイン';
	@override String get register => '新規登録はこちら';
}

// Path: signUpScreen
class _StringsSignUpScreenJa implements _StringsSignUpScreenEn {
	_StringsSignUpScreenJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '新規登録';
	@override String get name => '名前';
	@override String get email => 'メールアドレス';
	@override String get password => 'パスワード';
	@override String get confirmPassword => 'パスワード（確認）';
	@override String get register => '登録';
}

// Path: settingScreen
class _StringsSettingScreenJa implements _StringsSettingScreenEn {
	_StringsSettingScreenJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '設定';
	@override String get themeTitle => '配色';
	@override String get theme => 'テーマ';
	@override String get accountTitle => 'アカウント関連';
	@override String get logout => 'ログアウトする';
}

// Path: homeScreen
class _StringsHomeScreenJa implements _StringsHomeScreenEn {
	_StringsHomeScreenJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ホーム';
	@override String get text => '本を追加しよう！';
}

// Path: booksScreen
class _StringsBooksScreenJa implements _StringsBooksScreenEn {
	_StringsBooksScreenJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '本棚';
	@override String get text => '本を追加しよう！';
}

// Path: addBookPopup
class _StringsAddBookPopupJa implements _StringsAddBookPopupEn {
	_StringsAddBookPopupJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '本を追加';
	@override String get name => 'タイトル';
	@override String get url => 'URL';
	@override String get description => '説明';
	@override String get cancel => 'キャンセル';
	@override String get add => '追加';
}

// Path: myPageScreen
class _StringsMyPageScreenJa implements _StringsMyPageScreenEn {
	_StringsMyPageScreenJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'マイページ';
	@override String get bookCount => '本の数';
	@override String get count => '冊';
	@override String get editBunnton => '編集';
}

// Path: myPageEditScreen
class _StringsMyPageEditScreenJa implements _StringsMyPageEditScreenEn {
	_StringsMyPageEditScreenJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'プロフィール編集';
	@override String get save => '保存';
}

// Path: bottomNavigation
class _StringsBottomNavigationJa implements _StringsBottomNavigationEn {
	_StringsBottomNavigationJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get home => 'ホーム';
	@override String get books => '本棚';
	@override String get myPage => 'マイページ';
}

// Path: error
class _StringsErrorJa implements _StringsErrorEn {
	_StringsErrorJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get email => 'メールアドレスを入力してください';
	@override String get password => 'パスワードを入力してください';
	@override String get confirmPassword => 'パスワード（確認）を入力してください';
	@override String get passwordNotMatch => 'パスワードが一致しません';
	@override String get name => '名前を入力してください';
	@override String get emailFormat => 'メールアドレスの形式が正しくありません';
	@override String get passwordLength => 'パスワードは6文字以上で入力してください';
	@override String get emailExist => 'このメールアドレスは既に登録されています';
	@override String get loginFailed => 'ログインに失敗しました';
	@override String get registerFailed => '登録に失敗しました';
	@override String get logoutFailed => 'ログアウトに失敗しました';
	@override String get fetchFailed => 'データの取得に失敗しました';
	@override String get updateFailed => 'データの更新に失敗しました';
	@override String get deleteFailed => 'データの削除に失敗しました';
	@override String get noData => 'データがありません';
	@override String get noConnection => 'インターネットに接続してください';
	@override String get unknown => 'エラーが発生しました';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'loginScreen.title': return 'Sign In';
			case 'loginScreen.email': return 'Email Address';
			case 'loginScreen.password': return 'Password';
			case 'loginScreen.login': return 'Sign In';
			case 'loginScreen.register': return 'Register here';
			case 'signUpScreen.title': return 'Register';
			case 'signUpScreen.name': return 'Name';
			case 'signUpScreen.email': return 'Email Address';
			case 'signUpScreen.password': return 'Password';
			case 'signUpScreen.confirmPassword': return 'Confirm Password';
			case 'signUpScreen.register': return 'Register';
			case 'settingScreen.title': return 'Settings';
			case 'settingScreen.themeTitle': return 'Color Scheme';
			case 'settingScreen.theme': return 'Theme';
			case 'settingScreen.accountTitle': return 'Account Related';
			case 'settingScreen.logout': return 'Log Out';
			case 'homeScreen.title': return 'Home';
			case 'homeScreen.text': return 'Let\'s add a book';
			case 'booksScreen.title': return 'Bookshelf';
			case 'booksScreen.text': return 'Let\'s add a book';
			case 'addBookPopup.title': return 'Added a book';
			case 'addBookPopup.name': return 'Title';
			case 'addBookPopup.url': return 'url';
			case 'addBookPopup.description': return 'Description';
			case 'addBookPopup.cancel': return 'Cancel';
			case 'addBookPopup.add': return 'Add';
			case 'myPageScreen.title': return 'My Page';
			case 'myPageScreen.bookCount': return 'Number of Books';
			case 'myPageScreen.count': return '';
			case 'myPageScreen.editBunnton': return 'Edit';
			case 'myPageEditScreen.title': return 'Edit Profile';
			case 'myPageEditScreen.save': return 'Save';
			case 'bottomNavigation.home': return 'Home';
			case 'bottomNavigation.books': return 'Bookshelf';
			case 'bottomNavigation.myPage': return 'My Page';
			case 'error.email': return 'Please enter your email address';
			case 'error.password': return 'Please enter your password';
			case 'error.confirmPassword': return 'Please confirm your password';
			case 'error.passwordNotMatch': return 'Passwords do not match';
			case 'error.name': return 'Please enter your name';
			case 'error.emailFormat': return 'Email format is incorrect';
			case 'error.passwordLength': return 'Password must be at least 6 characters';
			case 'error.emailExist': return 'This email is already registered';
			case 'error.loginFailed': return 'Failed to sign in';
			case 'error.registerFailed': return 'Failed to register';
			case 'error.logoutFailed': return 'Failed to log out';
			case 'error.fetchFailed': return 'Failed to fetch data';
			case 'error.updateFailed': return 'Failed to update data';
			case 'error.deleteFailed': return 'Failed to delete data';
			case 'error.noData': return 'No data available';
			case 'error.noConnection': return 'Please connect to the internet';
			case 'error.unknown': return 'An error occurred';
			case 'locales.en': return 'English';
			case 'locales.ja': return 'Japanese';
			default: return null;
		}
	}
}

extension on _StringsJa {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'loginScreen.title': return 'サインイン';
			case 'loginScreen.email': return 'メールアドレス';
			case 'loginScreen.password': return 'パスワード';
			case 'loginScreen.login': return 'サインイン';
			case 'loginScreen.register': return '新規登録はこちら';
			case 'signUpScreen.title': return '新規登録';
			case 'signUpScreen.name': return '名前';
			case 'signUpScreen.email': return 'メールアドレス';
			case 'signUpScreen.password': return 'パスワード';
			case 'signUpScreen.confirmPassword': return 'パスワード（確認）';
			case 'signUpScreen.register': return '登録';
			case 'settingScreen.title': return '設定';
			case 'settingScreen.themeTitle': return '配色';
			case 'settingScreen.theme': return 'テーマ';
			case 'settingScreen.accountTitle': return 'アカウント関連';
			case 'settingScreen.logout': return 'ログアウトする';
			case 'homeScreen.title': return 'ホーム';
			case 'homeScreen.text': return '本を追加しよう！';
			case 'booksScreen.title': return '本棚';
			case 'booksScreen.text': return '本を追加しよう！';
			case 'addBookPopup.title': return '本を追加';
			case 'addBookPopup.name': return 'タイトル';
			case 'addBookPopup.url': return 'URL';
			case 'addBookPopup.description': return '説明';
			case 'addBookPopup.cancel': return 'キャンセル';
			case 'addBookPopup.add': return '追加';
			case 'myPageScreen.title': return 'マイページ';
			case 'myPageScreen.bookCount': return '本の数';
			case 'myPageScreen.count': return '冊';
			case 'myPageScreen.editBunnton': return '編集';
			case 'myPageEditScreen.title': return 'プロフィール編集';
			case 'myPageEditScreen.save': return '保存';
			case 'bottomNavigation.home': return 'ホーム';
			case 'bottomNavigation.books': return '本棚';
			case 'bottomNavigation.myPage': return 'マイページ';
			case 'error.email': return 'メールアドレスを入力してください';
			case 'error.password': return 'パスワードを入力してください';
			case 'error.confirmPassword': return 'パスワード（確認）を入力してください';
			case 'error.passwordNotMatch': return 'パスワードが一致しません';
			case 'error.name': return '名前を入力してください';
			case 'error.emailFormat': return 'メールアドレスの形式が正しくありません';
			case 'error.passwordLength': return 'パスワードは6文字以上で入力してください';
			case 'error.emailExist': return 'このメールアドレスは既に登録されています';
			case 'error.loginFailed': return 'ログインに失敗しました';
			case 'error.registerFailed': return '登録に失敗しました';
			case 'error.logoutFailed': return 'ログアウトに失敗しました';
			case 'error.fetchFailed': return 'データの取得に失敗しました';
			case 'error.updateFailed': return 'データの更新に失敗しました';
			case 'error.deleteFailed': return 'データの削除に失敗しました';
			case 'error.noData': return 'データがありません';
			case 'error.noConnection': return 'インターネットに接続してください';
			case 'error.unknown': return 'エラーが発生しました';
			case 'locales.en': return '英語';
			case 'locales.ja': return '日本語';
			default: return null;
		}
	}
}
