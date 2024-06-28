import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarStar extends StatelessWidget {
  const RatingBarStar({
    super.key,
    this.rating = 4.5,
  });
  final double rating;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemCount: 5,
      itemSize: 20,
      itemBuilder: (context, index) {
        return const Icon(Icons.star, color: TColors.primary);
      },
    );
  }
}
