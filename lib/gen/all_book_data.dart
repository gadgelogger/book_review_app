//全員の投稿のモデル(けどbook_dataと同じなので統一しても良さそう)
import 'package:book_review_app/exceptions/date_time_timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_book_data.freezed.dart';
part 'all_book_data.g.dart';

@freezed
class AllBookData with _$AllBookData {
  const factory AllBookData({
    required String uid,
    required String bookId,
    required String title,
    required String description,
    String? bookImageUrl,
    String? url,
    @DateTimeTimestampConverter() required DateTime createdAt,
    @DateTimeTimestampConverter() required DateTime updatedAt,
    String? userName,
  }) = _AllBookData;

  factory AllBookData.fromJson(Map<String, dynamic> json) =>
      _$AllBookDataFromJson(json);
}
