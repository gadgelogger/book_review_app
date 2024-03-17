import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_data.freezed.dart';
part 'book_data.g.dart';

@freezed
class BookData with _$BookData {
  const factory BookData({
    required String bookId,
    required String title,
    required String description,
    String? imageUrl,
    String? url,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _BookData;

  factory BookData.fromJson(Map<String, dynamic> json) =>
      _$BookDataFromJson(json);
}
