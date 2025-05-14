import 'package:flutter/material.dart';


class MovieRatingStars extends StatelessWidget {
  final double? voteAverage;

  const MovieRatingStars({Key? key, required this.voteAverage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (voteAverage == null) {
      return const Text("Rating: N/A");
    }

    double ratingOutOfFive = voteAverage! / 2;
    int fullStars = ratingOutOfFive.floor();
    bool hasHalfStar = (ratingOutOfFive - fullStars) >= 0.5;
    int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Full stars
        for (int i = 0; i < fullStars; i++)
          const Icon(Icons.star, color: Colors.amber, size: 20),

        // Half star if applicable
        if (hasHalfStar)
          const Icon(Icons.star_half, color: Colors.amber, size: 20),

        // Empty stars
        for (int i = 0; i < emptyStars; i++)
          const Icon(Icons.star_border, color: Colors.amber, size: 20),

        const SizedBox(width: 8),

        // Numeric rating
        Text(
          voteAverage!.toStringAsFixed(1),
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
