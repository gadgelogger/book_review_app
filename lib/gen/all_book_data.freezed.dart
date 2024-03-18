// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_book_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AllBookData _$AllBookDataFromJson(Map<String, dynamic> json) {
  return _AllBookData.fromJson(json);
}

/// @nodoc
mixin _$AllBookData {
  String get uid => throw _privateConstructorUsedError;
  String get bookId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get bookImageUrl => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllBookDataCopyWith<AllBookData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllBookDataCopyWith<$Res> {
  factory $AllBookDataCopyWith(
          AllBookData value, $Res Function(AllBookData) then) =
      _$AllBookDataCopyWithImpl<$Res, AllBookData>;
  @useResult
  $Res call(
      {String uid,
      String bookId,
      String title,
      String description,
      String? bookImageUrl,
      String? url,
      @DateTimeTimestampConverter() DateTime createdAt,
      @DateTimeTimestampConverter() DateTime updatedAt,
      String? userName});
}

/// @nodoc
class _$AllBookDataCopyWithImpl<$Res, $Val extends AllBookData>
    implements $AllBookDataCopyWith<$Res> {
  _$AllBookDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? bookId = null,
    Object? title = null,
    Object? description = null,
    Object? bookImageUrl = freezed,
    Object? url = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? userName = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      bookImageUrl: freezed == bookImageUrl
          ? _value.bookImageUrl
          : bookImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllBookDataImplCopyWith<$Res>
    implements $AllBookDataCopyWith<$Res> {
  factory _$$AllBookDataImplCopyWith(
          _$AllBookDataImpl value, $Res Function(_$AllBookDataImpl) then) =
      __$$AllBookDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String bookId,
      String title,
      String description,
      String? bookImageUrl,
      String? url,
      @DateTimeTimestampConverter() DateTime createdAt,
      @DateTimeTimestampConverter() DateTime updatedAt,
      String? userName});
}

/// @nodoc
class __$$AllBookDataImplCopyWithImpl<$Res>
    extends _$AllBookDataCopyWithImpl<$Res, _$AllBookDataImpl>
    implements _$$AllBookDataImplCopyWith<$Res> {
  __$$AllBookDataImplCopyWithImpl(
      _$AllBookDataImpl _value, $Res Function(_$AllBookDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? bookId = null,
    Object? title = null,
    Object? description = null,
    Object? bookImageUrl = freezed,
    Object? url = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? userName = freezed,
  }) {
    return _then(_$AllBookDataImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      bookImageUrl: freezed == bookImageUrl
          ? _value.bookImageUrl
          : bookImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AllBookDataImpl implements _AllBookData {
  const _$AllBookDataImpl(
      {required this.uid,
      required this.bookId,
      required this.title,
      required this.description,
      this.bookImageUrl,
      this.url,
      @DateTimeTimestampConverter() required this.createdAt,
      @DateTimeTimestampConverter() required this.updatedAt,
      this.userName});

  factory _$AllBookDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllBookDataImplFromJson(json);

  @override
  final String uid;
  @override
  final String bookId;
  @override
  final String title;
  @override
  final String description;
  @override
  final String? bookImageUrl;
  @override
  final String? url;
  @override
  @DateTimeTimestampConverter()
  final DateTime createdAt;
  @override
  @DateTimeTimestampConverter()
  final DateTime updatedAt;
  @override
  final String? userName;

  @override
  String toString() {
    return 'AllBookData(uid: $uid, bookId: $bookId, title: $title, description: $description, bookImageUrl: $bookImageUrl, url: $url, createdAt: $createdAt, updatedAt: $updatedAt, userName: $userName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllBookDataImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.bookId, bookId) || other.bookId == bookId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.bookImageUrl, bookImageUrl) ||
                other.bookImageUrl == bookImageUrl) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, bookId, title, description,
      bookImageUrl, url, createdAt, updatedAt, userName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllBookDataImplCopyWith<_$AllBookDataImpl> get copyWith =>
      __$$AllBookDataImplCopyWithImpl<_$AllBookDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllBookDataImplToJson(
      this,
    );
  }
}

abstract class _AllBookData implements AllBookData {
  const factory _AllBookData(
      {required final String uid,
      required final String bookId,
      required final String title,
      required final String description,
      final String? bookImageUrl,
      final String? url,
      @DateTimeTimestampConverter() required final DateTime createdAt,
      @DateTimeTimestampConverter() required final DateTime updatedAt,
      final String? userName}) = _$AllBookDataImpl;

  factory _AllBookData.fromJson(Map<String, dynamic> json) =
      _$AllBookDataImpl.fromJson;

  @override
  String get uid;
  @override
  String get bookId;
  @override
  String get title;
  @override
  String get description;
  @override
  String? get bookImageUrl;
  @override
  String? get url;
  @override
  @DateTimeTimestampConverter()
  DateTime get createdAt;
  @override
  @DateTimeTimestampConverter()
  DateTime get updatedAt;
  @override
  String? get userName;
  @override
  @JsonKey(ignore: true)
  _$$AllBookDataImplCopyWith<_$AllBookDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
