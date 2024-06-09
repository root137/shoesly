import 'package:flutter/material.dart';

class ShoeslyNetworkImage extends StatelessWidget {
  const ShoeslyNetworkImage({
    super.key,
    this.imageUrl,
  });

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return imageUrl != null
        ? Image.network(
            imageUrl ?? '',
          )
        : Image.asset(
            'assets/images/placeholder.png',
          );
  }
}
