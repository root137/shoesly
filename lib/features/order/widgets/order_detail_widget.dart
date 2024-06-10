import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/core/resources/strings.dart';
import 'package:shoesly/core/themes/app_colors.dart';
import 'package:shoesly/features/cart/controller/cart_state.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({super.key, required this.cartAsync});

  final AsyncValue<CartState>? cartAsync;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          s_orderDetails,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 20),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final cartItem = cartAsync?.value?.cartItems[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    cartItem?.productName ?? '',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        '${cartItem?.brandName} . ${getColorNameFromCode(cartItem?.productColor ?? '')} . ${cartItem?.productSize} .  Qty ${cartItem?.quantity} ',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: COLOR_DARK_GREY,
                            ),
                      ),
                    ),
                    Text(
                      '\$${cartItem?.productPrice.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 20);
          },
          itemCount: cartAsync?.value?.cartItems.length ?? 0,
        ),
      ],
    );
  }

  String getColorNameFromCode(String colorCode) {
    // Convert the color code string to lowercase and remove leading '#'
    colorCode = colorCode.toLowerCase().replaceAll('#', '');

    // Match the color code with predefined colors and return their names
    switch (colorCode) {
      case '000000':
        return 'Black';
      case 'ffffff':
        return 'White';
      case '0000ff':
        return 'Blue';
      case '808080':
        return 'Grey';
      case 'ffff00':
        return 'Yellow';
      case '008800':
        return 'Green';
      case 'ff0000':
        return 'Red';
      default:
        return 'Unknown';
    }
  }
}
