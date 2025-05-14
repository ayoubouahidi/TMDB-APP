import 'package:flutter/material.dart';


class MoviesOverview extends StatelessWidget {
  final String? overview;

  const MoviesOverview({Key? key, required this.overview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Overview:",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 5),
      Text(
        overview ?? "No overview available",
        style: const TextStyle(fontSize: 16),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    ],
  ),
);

  }
}
