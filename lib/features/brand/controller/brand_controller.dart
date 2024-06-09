import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/features/brand/controller/brand_state.dart';
import 'package:shoesly/features/brand/model/brand.dart';
import 'package:shoesly/features/brand/service/brand_service.dart';
import 'package:collection/collection.dart';

final brandControllerProvider =
    StateNotifierProvider<BrandController, AsyncValue<BrandState>>((ref) {
  return BrandController(ref);
});

class BrandController extends StateNotifier<AsyncValue<BrandState>> {
  BrandController(this.ref) : super(const AsyncValue.loading()) {
    fetchBrands();
  }

  final Ref ref;

  Future<void> fetchBrands() async {
    try {
      final List<Brand> brands =
          await ref.read(brandServiceProvider).fetchBrands();
      // Insert all brands at the beginning of the list
      brands.insert(0, Brand.allBrand());
      state = AsyncValue.data(BrandState(allBrands: brands));
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }

  void updateBrandIndexByBrandId(String brandId) {
    if (state.value != null) {
      state = AsyncData(state.value!.copyWith(selectedBrandId: brandId));
    }
  }

  Brand? getBrandById(String id) {
    final List<Brand>? brands = state.value?.allBrands;
    return brands?.firstWhereOrNull((brand) => brand.id == id);
  }
}
