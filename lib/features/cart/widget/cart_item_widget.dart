import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/core/resources/assets.dart';
import 'package:shoesly/core/themes/app_colors.dart';
import 'package:shoesly/core/widgets/shoesly_icon_button.dart';

class CartItemWidget extends ConsumerStatefulWidget {
  const CartItemWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends ConsumerState<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    const height10 = SizedBox(height: 10);
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        padding: const EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        decoration: const BoxDecoration(
          color: COLOR_ERROR,
        ),
        child: const ShoeslyIconButton(
          assetImagePath: a_trash,
          iconColor: COLOR_WHITE,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 88,
            width: 88,
            decoration: BoxDecoration(
              color: COLOR_PRIMARY_200,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nike Air Max 270',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                height10,
                Text(
                  'Nike . Black . 40',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: COLOR_PRIMARY_400,
                      ),
                ),
                height10,
                Row(
                  children: [
                    Text(
                      '\$100',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const Spacer(),
                    const ShoeslyIconButton(
                      assetImagePath: a_minus_circle,
                      iconColor: COLOR_PRIMARY_300,
                    ),
                    height10,
                    Text(
                      '1',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    height10,
                    const ShoeslyIconButton(
                      assetImagePath: a_add_circle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
