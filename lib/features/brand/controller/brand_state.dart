import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoesly/features/brand/model/brand.dart';

part 'brand_state.freezed.dart';

@freezed
class BrandState with _$BrandState {
  factory BrandState({
    /// Index of the brand which is selected
    @Default('') String selectedBrandId,
    required List<Brand> allBrands,
  }) = _BrandState;
}
