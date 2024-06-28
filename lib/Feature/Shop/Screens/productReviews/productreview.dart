import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/productReviews/widgets/overall_rating.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/productReviews/widgets/ratingbar.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/productReviews/widgets/user_reviews_card.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';

class ProductReviews extends StatelessWidget {
  const ProductReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Reviews and ratings'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                    'Rating and reviews are varified and and arefrom people who uses the same type of device you use'),
                const SizedBox(height: TSizes.spaceBtwItems),

                /// overall rating

                const OverallProductReview(
                    totalAverage: '4.5',
                    star5: 0.8,
                    star4: 0.5,
                    star3: 0.2,
                    star2: 0.6,
                    star1: 0.3),
                const RatingBarStar(rating: 4.5),
                Text(
                  '12,611',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),

                ///user reviews list
                const UserReviewsCard(
                    userDate: ' 01 Nov 2023',
                    username: 'Athul',
                    userReviewReceived:
                        'A simple yet fully customizable ratingbar for flutter which also include a rating bar indicator, supporting any fraction of rating.',
                    rating: 4.5,
                    userimage: TImages.user,
                    companyName: 'crystal',
                    companyDate: ' 01 Nov 2023',
                    companyReviewSend:
                        'A simple yet fully customizable ratingbar for flutter which also include a rating bar indicator, supporting any fraction of rating.')
              ],
            )),
      ),
    );
  }
}
