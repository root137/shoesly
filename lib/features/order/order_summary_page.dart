import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/core/resources/strings.dart';
import 'package:shoesly/core/themes/app_colors.dart';
import 'package:shoesly/core/widgets/shoesly_appbar.dart';
import 'package:shoesly/features/cart/controller/cart_controller.dart';
import 'package:shoesly/features/order/widgets/order_summary_bottombar.dart';
import 'package:shoesly/features/order/widgets/order_summary_detail.dart';

class OrderSummaryPage extends ConsumerWidget {
  const OrderSummaryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartAsync = ref.watch(cartControllerProvider);
    final double totalPrice = cartAsync.value?.totalPrice ?? 0;
    const double shippingFee = 20.0;

    return Scaffold(
      appBar: ShoeslyAppbar(
        backgroundColor: COLOR_PRIMARY_100.withOpacity(0.4),
        title: s_orderSummary,
        centreTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: COLOR_PRIMARY_100.withOpacity(0.4),
        child: SingleChildScrollView(
          child: OrderSummaryDetail(
            cartAsync: cartAsync,
            totalPrice: totalPrice,
            shippingFee: shippingFee,
          ),
        ),
      ),
      bottomNavigationBar: OrderSummaryBottomBar(
        totalPrice: totalPrice,
        shippingFee: shippingFee,
      ),
    );
  }
}
