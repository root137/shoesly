import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/features/product/core/model/product.dart';
import 'package:shoesly/features/product/core/service/product_service.dart';

final productControllerProvider =
    StateNotifierProvider<ProductController, AsyncValue<List<Product>>>((ref) {
  return ProductController(ref);
});

class ProductController extends StateNotifier<AsyncValue<List<Product>>> {
  ProductController(this.ref) : super(const AsyncValue.loading());

  final Ref ref;

  Future<void> fetchProducts(String? brandId) async {
    try {
      state = const AsyncLoading();
      final List<Product> products =
          await ref.read(productServiceProvider).fetchProducts(brandId);
      state = AsyncValue.data(products);
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }
}
