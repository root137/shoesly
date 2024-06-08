import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/core/resources/assets.dart';
import 'package:shoesly/core/themes/app_colors.dart';
import 'package:shoesly/core/widgets/shoesly_icon_button.dart';

class BrandWidget extends ConsumerStatefulWidget {
  const BrandWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BrandWidgetState();
}

class _BrandWidgetState extends ConsumerState<BrandWidget> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  color: COLOR_PRIMARY_200,
                  shape: BoxShape.circle,
                ),
              ),
              if (selected)
                const Positioned(
                  bottom: -12,
                  right: -8,
                  child: ShoeslyIconButton(
                    assetImagePath: a_tick_circle_filled,
                  ),
                )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Brand Name',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text('Product Count',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: COLOR_PRIMARY_300,
                  ))
        ],
      ),
    );
  }
}
