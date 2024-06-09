import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/features/filter/controller/filter_state.dart';
import 'package:shoesly/features/filter/filter_page.dart';

final filterControllerProvider =
    StateNotifierProvider<FilterNotifier, FilterArgs>((ref) {
  return FilterNotifier();
});

class FilterNotifier extends StateNotifier<FilterArgs> {
  FilterNotifier() : super(FilterArgs.initial());

  void updateFilterArgs({
    String? brandId,
    double? minPrice,
    double? maxPrice,
    SortByEnum? sortBy,
    SortByGenderEnum? sortByGender,
    SortByColorEnum? sortByColor,
  }) {
    state = state.copyWith(
      brandId: brandId,
      minPrice: minPrice,
      maxPrice: maxPrice,
      sortBy: sortBy,
      sortByGender: sortByGender,
      sortByColor: sortByColor,
    );
  }

  void clearFilter() {
    state = FilterArgs.initial();
  }
}
