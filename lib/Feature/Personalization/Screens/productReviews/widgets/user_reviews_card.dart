import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/Product/rounded_container.dart';
import 'package:flutter_application_1/Feature/Personalization/Screens/productReviews/widgets/ratingbar.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';

class UserReviewsCard extends StatelessWidget {
  const UserReviewsCard(
      {super.key,
      required this.userDate,
      required this.username,
      required this.userReviewReceived,
      required this.rating,
      required this.userimage,
      required this.companyName,
      required this.companyDate,
      required this.companyReviewSend});
  final String userDate, username, userReviewReceived;
  final double rating;
  final String userimage;
  final String companyName, companyDate, companyReviewSend;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage(userimage)),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(username, style: Theme.of(context).textTheme.titleLarge),
            const Spacer(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Row(
          children: [
            RatingBarStar(rating: rating),
            Text(userDate, style: Theme.of(context).textTheme.bodySmall)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        ReadMoreText(
            colorClickableText: Colors.black,
            trimLines: 3,
            trimMode: TrimMode.Line,
            trimCollapsedText: ' Show more',
            trimExpandedText: ' Show less',
            moreStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: TColors.primary),
            lessStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: TColors.primary),
            userReviewReceived,
            style: TextStyle(
              fontSize: 15,
              color: TColors.black,
            )),
        const SizedBox(height: TSizes.spaceBtwItems),

        ///company reviews
        TRoundedContainer(
            backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
            child: Padding(
                padding: const EdgeInsets.all(TSizes.md),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(companyName,
                            style: Theme.of(context).textTheme.bodyLarge),
                        const Spacer(),
                        Text(companyDate,
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    ReadMoreText(
                        colorClickableText: Colors.black,
                        trimLines: 3,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: ' Show more',
                        trimExpandedText: ' Show less',
                        moreStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: TColors.primary),
                        lessStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: TColors.primary),
                        companyReviewSend,
                        style: TextStyle(
                          fontSize: 15,
                          color: TColors.black,
                        ))
                  ],
                ))),
      ],
    );
  }
}
