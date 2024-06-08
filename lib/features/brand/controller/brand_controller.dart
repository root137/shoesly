import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/features/brand/model/brand.dart';
import 'package:shoesly/features/brand/service/brand_service.dart';

final brandControllerProvider =
    StateNotifierProvider<BrandController, AsyncValue<List<Brand>>>((ref) {
  return BrandController(ref);
});

class BrandController extends StateNotifier<AsyncValue<List<Brand>>> {
  BrandController(this.ref) : super(const AsyncValue.loading()) {
    fetchBrands();
  }

  final Ref ref;

  Future<void> fetchBrands() async {
    try {
      final List<Brand> brands =
          await ref.read(brandServiceProvider).fetchBrands();
      brands.insert(0, Brand.allBrand());
      state = AsyncValue.data(brands);
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }
}
