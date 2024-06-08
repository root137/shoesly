import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/core/themes/app_colors.dart';

class ProductItem extends ConsumerWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(16).copyWith(
            top: 8,
          ),
          height: 150,
          width: 150,
          decoration: const BoxDecoration(
            color: COLOR_PRIMARY_100,
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: SvgPicture.asset(
                  'assets/nike.svg',
                  height: 24,
                  width: 24,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Image.asset(
                'assets/aj1.png',
                height: 85,
                width: 120,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Flexible(
          child: Text(
            'Nike Air Jordan 1',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'High OG',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          '\$ 200',
          style: Theme.of(context).textTheme.titleMedium,
        )
      ],
    );
  }
}
