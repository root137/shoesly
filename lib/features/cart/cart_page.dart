import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shoesly/core/resources/strings.dart';
import 'package:shoesly/core/router/routes.dart';
import 'package:shoesly/core/themes/app_colors.dart';
import 'package:shoesly/core/widgets/shoesly_appbar.dart';
import 'package:shoesly/core/widgets/shoesly_elevated_button.dart';
import 'package:shoesly/features/cart/controller/cart_controller.dart';
import 'package:shoesly/features/cart/widget/cart_item_widget.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  ConsumerState<CartPage> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(cartControllerProvider.notifier).fetchCartItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartAsync = ref.watch(cartControllerProvider);
    final double totalPrice = cartAsync.value?.totalPrice ?? 0;
    return Scaffold(
      appBar: ShoeslyAppbar(
        backgroundColor: COLOR_PRIMARY_100.withOpacity(0.4),
        title: s_cart,
        centreTitle: true,
      ),
      body: cartAsync.when(
        data: (cartState) {
          if (cartState.cartItems.isEmpty) {
            return const Center(
              child: Text('No Items in Cart'),
            );
          }
          return ColoredBox(
            color: COLOR_PRIMARY_100.withOpacity(0.4),
            child: ListView.builder(
              itemBuilder: (_, index) {
                return CartItemWidget(
                  cart: cartState.cartItems[index],
                  onQuantityChanged: (itemPrice) {
                    ref
                        .read(cartControllerProvider.notifier)
                        .updateTotalPrice(itemPrice);
                  },
                );
              },
              itemCount: cartState.cartItems.length,
            ),
          );
        },
        error: (error, _) => Center(
          child: Text(error.toString()),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 20,
        ),
        decoration: const BoxDecoration(
          color: COLOR_WHITE,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    s_grandTotal,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: COLOR_PRIMARY_300,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '\$${totalPrice.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ShoeslyElevatedButton(
                text: s_checkOut,
                onPressed: () {
                  context.pushNamed(
                    Routes.orderPage.name,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
