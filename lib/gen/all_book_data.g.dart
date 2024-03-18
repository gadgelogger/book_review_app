// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_book_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AllBookDataImpl _$$AllBookDataImplFromJson(Map<String, dynamic> json) =>
    _$AllBookDataImpl(
      uid: json['uid'] as String,
      bookId: json['bookId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      bookImageUrl: json['bookImageUrl'] as String?,
      url: json['url'] as String?,
      createdAt: const DateTimeTimestampConverter()
          .fromJson(json['createdAt'] as Timestamp),
      updatedAt: const DateTimeTimestampConverter()
          .fromJson(json['updatedAt'] as Timestamp),
      userName: json['userName'] as String?,
    );

Map<String, dynamic> _$$AllBookDataImplToJson(_$AllBookDataImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'bookId': instance.bookId,
      'title': instance.title,
      'description': instance.description,
      'bookImageUrl': instance.bookImageUrl,
      'url': instance.url,
      'createdAt':
          const DateTimeTimestampConverter().toJson(instance.createdAt),
      'updatedAt':
          const DateTimeTimestampConverter().toJson(instance.updatedAt),
      'userName': instance.userName,
    };
