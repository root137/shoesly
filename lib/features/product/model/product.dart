import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required String brandId,
    required String reviewId,
    required String name,
    required double price,
    required List<String> imageUrls,
    required List<double> sizes,
    required String description,
    required List<String> colors,
    required String gender,
    required double averageRating,
    required int reviewCount,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
