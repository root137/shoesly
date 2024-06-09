import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/core/utils/custom_firebase_exception.dart';
import 'package:shoesly/features/filter/controller/filter_state.dart';
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
    } on CustomFirebaseException catch (ex) {
      state = AsyncError(ex.message, StackTrace.current);
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }

  Future<void> filterProducts(FilterArgs filterArgs) async {
    try {
      state = const AsyncValue.loading();
      final List<Product> filteredProducts =
          await ref.read(productServiceProvider).filterProducts(filterArgs);
      state = AsyncValue.data(filteredProducts);
    } on CustomFirebaseException catch (ex) {
      state = AsyncError(ex.message, StackTrace.current);
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }

  int getProductCountByBrandId(String brandId) {
    final List<Product> products = state.value ?? [];
    return products.where((product) => product.brandId == brandId).length;
  }
}
