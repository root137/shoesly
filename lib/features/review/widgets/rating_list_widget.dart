import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/core/themes/app_colors.dart';

class RatingListWidget extends ConsumerStatefulWidget {
  const RatingListWidget({super.key});

  @override
  ConsumerState<RatingListWidget> createState() => _RatingListWidgetState();
}

class _RatingListWidgetState extends ConsumerState<RatingListWidget> {
  // List of strings representing star ratings
  final List<String> starRatings = [
    'All',
    '5 Stars',
    '4 Stars',
    '3 Stars',
    '2 Stars',
    '1 Star',
  ];

  @override
  Widget build(BuildContext context) {
    return _buildRatingList();
  }

  SizedBox _buildRatingList() {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
        itemBuilder: (_, index) {
          // Get the star rating from the list
          final ratingText = starRatings[index];
          return InkWell(
            onTap: () {
              // Handle tap on star rating
            },
            child: Text(
              ratingText,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: index == 0 ? null : COLOR_PRIMARY_300,
                  ),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(
          width: 20,
        ),
        itemCount: starRatings.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
