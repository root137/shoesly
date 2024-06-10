import 'package:shoesly/features/cart/model/cart.dart';

class CartState {
  final List<Cart> cartItems;
  final double totalPrice;

  CartState({
    this.cartItems = const [],
    this.totalPrice = 0,
  });

  CartState copyWith({
    List<Cart>? cartItems,
    double? totalPrice,
  }) {
    return CartState(
      cartItems: cartItems ?? this.cartItems,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
