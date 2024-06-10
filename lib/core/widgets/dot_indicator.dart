import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
    );
  }
}
