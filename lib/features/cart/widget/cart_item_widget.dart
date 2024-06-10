import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/core/resources/assets.dart';
import 'package:shoesly/core/themes/app_colors.dart';
import 'package:shoesly/core/widgets/shoesly_icon_button.dart';
import 'package:shoesly/core/widgets/shoesly_network_image.dart';
import 'package:shoesly/features/cart/controller/cart_controller.dart';
import 'package:shoesly/features/cart/model/cart.dart';

class CartItemWidget extends ConsumerStatefulWidget {
  const CartItemWidget({
    required this.cart,
    this.onQuantityChanged,
    super.key,
  });

  final Cart cart;

  /// Returns the price of the product in the cart.
  final ValueSetter<double>? onQuantityChanged;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends ConsumerState<CartItemWidget> {
  late final Cart _cart = widget.cart;
  late int _quantity = _cart.quantity;

  @override
  Widget build(BuildContext context) {
    const height10 = SizedBox(height: 10);

    return Dismissible(
      key: UniqueKey(),
      onDismissed: (_) {
        ref.read(cartControllerProvider.notifier).removeFromCart(widget.cart);
      },
      direction: DismissDirection.endToStart,
      background: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        alignment: Alignment.centerRight,
        decoration: const BoxDecoration(
          color: COLOR_ERROR,
        ),
        child: const ShoeslyIconButton(
          assetImagePath: a_trash,
          iconColor: COLOR_WHITE,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 88,
              width: 88,
              child: ShoeslyNetworkImage(
                imageUrl: _cart.productImageUrl,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _cart.productName,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  height10,
                  Text(
                    '${_cart.brandName} . ${_cart.productColor} . ${_cart.productSize}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: COLOR_PRIMARY_400,
                        ),
                  ),
                  Row(
                    children: [
                      Text('\$${_cart.productPrice.toStringAsFixed(2)}',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                              )),
                      const Spacer(),
                      ShoeslyIconButton(
                        assetImagePath: a_minus_circle,
                        iconColor: _quantity == 1 ? COLOR_PRIMARY_300 : null,
                        onPressed: () => _decreaseQuantity(),
                      ),
                      height10,
                      Text(
                        '$_quantity',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      height10,
                      ShoeslyIconButton(
                        assetImagePath: a_add_circle,
                        onPressed: () => _increaseQuantity(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _increaseQuantity() {
    setState(() {
      _quantity++;
    });
    widget.onQuantityChanged?.call(_cart.productPrice);
  }

  void _decreaseQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
      widget.onQuantityChanged?.call(-_cart.productPrice);
    }
  }
}
