// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookDataImpl _$$BookDataImplFromJson(Map<String, dynamic> json) =>
    _$BookDataImpl(
      uid: json['uid'] as String,
      banned: json['banned'] as bool,
      email: json['email'] as String,
      bookId: json['bookId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      bookImageUrl: json['bookImageUrl'] as String?,
      url: json['url'] as String?,
      createdAt: const DateTimeTimestampConverter()
          .fromJson(json['createdAt'] as Timestamp),
      updatedAt: const DateTimeTimestampConverter()
          .fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$BookDataImplToJson(_$BookDataImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'banned': instance.banned,
      'email': instance.email,
      'bookId': instance.bookId,
      'title': instance.title,
      'description': instance.description,
      'bookImageUrl': instance.bookImageUrl,
      'url': instance.url,
      'createdAt':
          const DateTimeTimestampConverter().toJson(instance.createdAt),
      'updatedAt':
          const DateTimeTimestampConverter().toJson(instance.updatedAt),
    };
