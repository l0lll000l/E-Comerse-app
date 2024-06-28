import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/productReviews/widgets/rating_progress_indicator.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';

class OverallProductReview extends StatelessWidget {
  const OverallProductReview({
    super.key,
    required this.totalAverage,
    required this.star5,
    required this.star4,
    required this.star3,
    required this.star2,
    required this.star1,
  });
  final String totalAverage;
  final double star5, star4, star3, star2, star1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          totalAverage,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Expanded(
          child: Column(
            children: [
              RatingProgressIndicator(
                star: '5',
                value: star5,
              ),
              RatingProgressIndicator(
                star: '4',
                value: star4,
              ),
              RatingProgressIndicator(
                star: '3',
                value: star3,
              ),
              RatingProgressIndicator(
                star: '2',
                value: star2,
              ),
              RatingProgressIndicator(
                star: '1',
                value: star1,
              ),
            ],
          ),
        )
      ],
    );
  }
}
