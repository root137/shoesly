import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/core/utils/custom_firebase_exception.dart';
import 'package:shoesly/features/cart/controller/cart_state.dart';
import 'package:shoesly/features/cart/model/cart.dart';
import 'package:shoesly/features/cart/service/cart_service.dart';

final cartControllerProvider =
    StateNotifierProvider<CartController, AsyncValue<CartState>>((ref) {
  return CartController(ref);
});

class CartController extends StateNotifier<AsyncValue<CartState>> {
  CartController(this._ref) : super(const AsyncValue.loading()) {
    fetchCartItems();
  }

  final Ref _ref;

  Future<void> fetchCartItems() async {
    try {
      state = const AsyncValue.loading();
      final cartService = _ref.read(cartServiceProvider);
      final List<Cart> cartList = await cartService.fetchCartItems();
      final double totalPrice = cartList.fold<double>(
        0,
        (previousValue, element) =>
            previousValue + element.productPrice * element.quantity,
      );
      state = AsyncValue.data(
          CartState(cartItems: cartList, totalPrice: totalPrice));
    } on CustomFirebaseException catch (error) {
      state = AsyncValue.error(error.message, StackTrace.current);
    } catch (error) {
      state = AsyncValue.error(
          'Error occurred while fetching carts', StackTrace.current);
    }
  }

  Future<void> addToCart(Cart cart) async {
    try {
      state = const AsyncValue.loading();
      final cartService = _ref.read(cartServiceProvider);
      await cartService.addToCart(cart);
    } on CustomFirebaseException catch (error) {
      state = AsyncValue.error(error.message, StackTrace.current);
    } catch (error) {
      state = AsyncValue.error(
          'Error occurred while adding to cart', StackTrace.current);
    }
  }

  Future<void> removeFromCart(Cart cart) async {
    try {
      final cartService = _ref.read(cartServiceProvider);
      await cartService.removeFromCart(cart);
    } on CustomFirebaseException catch (error) {
      state = AsyncValue.error(error.message, StackTrace.current);
    } catch (error) {
      state = AsyncValue.error(
          'Error occurred while removing from cart', StackTrace.current);
    }
  }

  void updateTotalPrice(double itemPrice) {
    // add to the totalPrice in the state variable
    final cartState = state.value;
    final double totalPrice = (cartState?.totalPrice ?? 0) + itemPrice;
    state.whenData((cartState) {
      state = AsyncValue.data(cartState.copyWith(totalPrice: totalPrice));
    });
  }
}
