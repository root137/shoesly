import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:shoesly/core/resources/assets.dart';
import 'package:shoesly/core/themes/app_colors.dart';
import 'package:shoesly/core/widgets/shoesly_icon_button.dart';
import 'package:shoesly/core/widgets/shoesly_network_image.dart';

class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({
    super.key,
    required this.imageUrls,
    required this.colors,
    required this.productId,
  });

  final List<String> imageUrls;
  final List<String> colors;
  final String productId;

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ).copyWith(top: 24),
            decoration: BoxDecoration(
              color: COLOR_PRIMARY_200,
              borderRadius: BorderRadius.circular(100),
            ),
            child: PageView.builder(
              itemBuilder: (context, index) {
                return ShoeslyNetworkImage(
                  imageUrl: widget.imageUrls[index],
                );
              },
              itemCount: widget.imageUrls.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            height: 40,
            width: 40,
            decoration:
                const BoxDecoration(color: COLOR_WHITE, shape: BoxShape.circle),
            child: const ShoeslyIconButton(
              assetImagePath: a_heart,
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          child: DotsIndicator(
            position: _currentIndex,
            decorator: const DotsDecorator(
              color: COLOR_PRIMARY_300,
              activeColor: COLOR_PRIMARY,
              size: Size(8, 8),
            ),
            dotsCount: widget.imageUrls.length,
          ),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              height: 40,
              decoration: BoxDecoration(
                color: COLOR_WHITE,
                borderRadius: BorderRadius.circular(30),
              ),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (contexxt, index) {
                  return Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: _getColor(widget.colors[index]),
                      shape: BoxShape.circle,
                      border: const Border.fromBorderSide(
                        BorderSide(
                          color: COLOR_PRIMARY_200,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 8,
                  );
                },
                itemCount: widget.colors.length,
              )),
        ),
      ],
    );
  }

  Color _getColor(String color) {
    return Color(int.parse('0xFF$color'));
  }
}
