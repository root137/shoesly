import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shoesly/core/resources/assets.dart';
import 'package:shoesly/core/resources/strings.dart';
import 'package:shoesly/core/router/routes.dart';
import 'package:shoesly/core/themes/app_colors.dart';
import 'package:shoesly/core/widgets/shoesly_appbar.dart';
import 'package:shoesly/core/widgets/shoesly_elevated_button.dart';
import 'package:shoesly/core/widgets/shoesly_icon_button.dart';
import 'package:shoesly/features/brand/brands_list_widget.dart';
import 'package:shoesly/features/product/features/product_list/controller/product_list_controller.dart';
import 'package:shoesly/features/product/features/product_list/widgets/product_list_widget.dart';

class ProductListPage extends ConsumerStatefulWidget {
  const ProductListPage({super.key});

  @override
  ConsumerState<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends ConsumerState<ProductListPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(productControllerProvider.notifier).fetchProducts(null);
    });
  }

  @override
  Widget build(BuildContext context) {
    final titleTextStyle = Theme.of(context).textTheme.displayMedium;
    ref.watch(productControllerProvider);
    return Scaffold(
      appBar: ShoeslyAppbar(
        title: s_discover,
        titleTextStyle: titleTextStyle,
        leadingIcon: false,
        centreTitle: false,
        actions: ShoeslyIconButton(
          assetImagePath: a_cart,
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          BrandsListWidget(
            onBrandSelected: (brandId) => ref
                .read(productControllerProvider.notifier)
                .fetchProducts(brandId),
          ),
          const Expanded(
            child: ProductListWidget(),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ShoeslyElevatedButton(
        height: 40,
        width: 150,
        icon: const ShoeslyIconButton(
          size: 20,
          iconColor: COLOR_WHITE,
          assetImagePath: a_filter,
        ),
        text: s_filter,
        onPressed: () {
          context.pushNamed(Routes.filterPage.name);
        },
      ),
    );
  }
}
