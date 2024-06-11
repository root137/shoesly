import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shoesly/core/themes/app_colors.dart';

class UserReviewWidget extends StatelessWidget {
  const UserReviewWidget({
    this.name,
    this.rating,
    this.description,
    this.date,
    this.imageUrl,
    super.key,
  });

  final String? name;
  final double? rating;
  final String? description;
  final DateTime? date;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
              imageUrl ??
                  'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: Row(
                  children: [
                    Text(
                      name ?? 'hello',
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                    const Spacer(),
                    Text(
                      date != null ? getFormattedDate(date!) : '',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: COLOR_PRIMARY_300,
                          ),
                      textAlign: TextAlign.end,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RatingBarIndicator(
                unratedColor: COLOR_PRIMARY_200,
                itemBuilder: (context, index) {
                  return const Icon(
                    Icons.star_rounded,
                    color: COLOR_WARNING,
                  );
                },
                itemSize: 20,
                rating: rating ?? 0,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: Text(
                  description ?? '',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String getFormattedDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    if (difference.inDays == 0) {
      return 'Today';
    } else {
      return '${difference.inDays.toString().replaceAll('-', '')} days ago';
    }
  }
}
