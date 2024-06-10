import 'package:shoesly/features/filter/filter_page.dart';

class FilterArgs {
  final String? brandId;
  final double? minPrice;
  final double? maxPrice;
  final SortByEnum? sortBy;
  final SortByGenderEnum? sortByGender;
  final SortByColorEnum? sortByColor;

  FilterArgs({
    this.brandId,
    this.minPrice,
    this.maxPrice,
    this.sortBy,
    this.sortByGender,
    this.sortByColor,
  });

  factory FilterArgs.initial() {
    return FilterArgs(minPrice: 30, maxPrice: 300);
  }

  FilterArgs copyWith({
    String? brandId,
    double? minPrice,
    double? maxPrice,
    SortByEnum? sortBy,
    SortByGenderEnum? sortByGender,
    SortByColorEnum? sortByColor,
  }) {
    return FilterArgs(
      brandId: brandId ?? this.brandId,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      sortBy: sortBy ?? this.sortBy,
      sortByGender: sortByGender ?? this.sortByGender,
      sortByColor: sortByColor ?? this.sortByColor,
    );
  }
}
