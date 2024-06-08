import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shoesly/core/router/routes.dart';
import 'package:shoesly/core/widgets/not_found_page.dart';
import 'package:shoesly/features/cart/cart_page.dart';
import 'package:shoesly/features/filter/filter_page.dart';
import 'package:shoesly/features/order/order_summary_page.dart';
import 'package:shoesly/features/product/product_detail/product_detail_page.dart';
import 'package:shoesly/features/product/features/product_list/product_list_page.dart';
import 'package:shoesly/features/review/review_page.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.productListPage.path,
    // debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.productListPage.path,
        name: Routes.productListPage.name,
        builder: (context, state) => const ProductListPage(),
      ),
      GoRoute(
        path: Routes.productDetailPage.path,
        name: Routes.productDetailPage.name,
        builder: (context, state) => const ProductDetailPage(),
      ),
      GoRoute(
        path: Routes.filterPage.path,
        name: Routes.filterPage.name,
        builder: (context, state) => const FilterPage(),
      ),
      GoRoute(
        path: Routes.reviewPage.path,
        name: Routes.reviewPage.name,
        builder: (context, state) => const ReviewPage(),
      ),
      GoRoute(
        path: Routes.cartPage.path,
        name: Routes.cartPage.name,
        builder: (context, state) => const CartPage(),
      ),
      GoRoute(
        path: Routes.orderPage.path,
        name: Routes.orderPage.name,
        builder: (context, state) => const OrderSummaryPage(),
      ),
    ],
    errorBuilder: (context, state) => const NotFoundPage(),
  );
});
