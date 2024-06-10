import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/core/resources/assets.dart';
import 'package:shoesly/core/resources/strings.dart';
import 'package:shoesly/core/themes/app_colors.dart';
import 'package:shoesly/core/widgets/shoesly_icon_button.dart';
import 'package:shoesly/features/cart/controller/cart_state.dart';

class OrderSummaryDetail extends ConsumerWidget {
  const OrderSummaryDetail({
    this.cartAsync,
    this.totalPrice,
    this.shippingFee,
    super.key,
  });

  final AsyncValue<CartState>? cartAsync;

  final double? totalPrice;
  final double? shippingFee;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const height20 = SizedBox(height: 20);
    final grandTotal = totalPrice! + shippingFee!;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                s_information,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              height20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        s_paymentMethod,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Credit Card',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: COLOR_DARK_GREY,
                            ),
                      ),
                    ],
                  ),
                  const ShoeslyIconButton(
                    iconColor: COLOR_PRIMARY_300,
                    size: 16,
                    assetImagePath: a_arrow_right,
                  )
                ],
              ),
              height20,
              const Divider(
                thickness: 1,
              ),
              height20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        s_location,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Semarang, Indonesia',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: COLOR_DARK_GREY,
                            ),
                      ),
                    ],
                  ),
                  const ShoeslyIconButton(
                    iconColor: COLOR_PRIMARY_300,
                    size: 16,
                    assetImagePath: a_arrow_right,
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                s_orderDetails,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              height20,
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
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              '${cartItem?.brandName} . ${cartItem?.productColor} . ${cartItem?.productSize} .  Qty ${cartItem?.quantity} ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
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
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: cartAsync?.value?.cartItems.length ?? 0,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                s_paymentDetail,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              height20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    s_subTotal,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: COLOR_DARK_GREY,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '\$${totalPrice!.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
              height20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    s_shipping,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: COLOR_DARK_GREY,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '\$${shippingFee!.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
              height20,
              const Divider(
                thickness: 1,
              ),
              height20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    s_totalOrder,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: COLOR_DARK_GREY,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '\$${grandTotal.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
