import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/features/product/features/product_list/controller/product_list_controller.dart';
import 'package:shoesly/features/product/features/product_list/widgets/product_item.dart';

class ProductListWidget extends ConsumerWidget {
  const ProductListWidget({super.key});

  // TODO: Create generic error widget
  // TODO: Create loader for each widget

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productListAsync = ref.watch(productControllerProvider);
    return productListAsync.when(
        data: (products) {
          if (products.isEmpty) {
            return const Center(
              child: Text('No Shoes Found'),
            );
          }
          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              childAspectRatio: 0.67,
            ),
            itemBuilder: (_, index) {
              return ProductItem(
                product: products[index],
                onPressed: () {},
              );
            },
          );
        },
        error: (error, __) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}