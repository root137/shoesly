import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/core/router/shoesly_router.dart';
import 'package:shoesly/core/themes/shoesly_theme.dart';

class ShoeslyApp extends ConsumerWidget {
  const ShoeslyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeConfig = ref.read(goRouterProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ShoeslyTheme.lightThemeData,
      routerConfig: routeConfig,
    );
  }
}
