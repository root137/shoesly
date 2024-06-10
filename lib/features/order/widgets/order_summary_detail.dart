import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/features/cart/controller/cart_state.dart';
import 'package:shoesly/features/order/widgets/order_detail_widget.dart';
import 'package:shoesly/features/order/widgets/payment_details_widget.dart';
import 'package:shoesly/features/order/widgets/payment_info_widget.dart';

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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PaymentInformationWidget(),
          const SizedBox(height: 30),
          OrderDetailsWidget(cartAsync: cartAsync),
          const SizedBox(height: 30),
          PaymentDetailsWidget(
              totalPrice: totalPrice, shippingFee: shippingFee),
        ],
      ),
    );
  }
}
