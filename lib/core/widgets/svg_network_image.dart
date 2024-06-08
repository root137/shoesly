import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgNetworkImage extends StatelessWidget {
  const SvgNetworkImage({required this.imageUrl, super.key});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(imageUrl);
  }
}
