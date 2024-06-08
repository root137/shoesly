import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/core/resources/strings.dart';
import 'package:shoesly/core/themes/app_colors.dart';
import 'package:shoesly/core/widgets/shoesly_appbar.dart';

class ReviewPage extends ConsumerWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: ShoeslyAppbar(
        centreTitle: true,
        title: '$s_review ${"(${hashCode.toRadixString(8).toUpperCase()})"}',
        actions: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Row(
            children: [
              const Icon(
                Icons.star_rounded,
                size: 20,
                color: Colors.amber,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '4.5',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      body: const UserReviewWidget(),
    );
  }
}

class UserReviewWidget extends StatelessWidget {
  const UserReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        'https://images.unsplash.com/photo-1493106819501-66d381c466f1?q=80&w=3456&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
              imageUrl,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nolan Carder',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              RatingBar.builder(
                unratedColor: COLOR_PRIMARY_100,
                initialRating: 3.5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star_rounded,
                  size: 10,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Description of the review',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const Spacer(),
          Text(
            '1 day ago',
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}
