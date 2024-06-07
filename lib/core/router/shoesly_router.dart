import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shoesly/core/router/routes.dart';
import 'package:shoesly/features/product/product_list/product_list_page.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.productList.path,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.productList.path,
        name: Routes.productList.name,
        builder: (context, state) => const ProductListPage(),
      ),
    ],
  );
});
