// book_data.dart
import 'package:book_review_app/exceptions/date_time_timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_book_data.freezed.dart';
part 'all_book_data.g.dart';

@freezed
class AllBookData with _$AllBookData {
  const factory AllBookData({
    required String bookId,
    required String title,
    required String description,
    String? imageUrl,
    String? url,
    @DateTimeTimestampConverter() required DateTime createdAt,
    @DateTimeTimestampConverter() required DateTime updatedAt,
  }) = _AllBookData;

  factory AllBookData.fromJson(Map<String, dynamic> json) =>
      _$AllBookDataFromJson(json);
}
