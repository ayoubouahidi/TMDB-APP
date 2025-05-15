import 'package:flutter/material.dart';
import '../sevice/Movie.dart';
import 'MoviesOverview.dart';
import 'MovieDetails.dart';
import 'NaveButtom.dart';


class MoviesScreen extends StatelessWidget {
  final Movie movie;

  const MoviesScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Movie Details")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MovieDetails(movie: movie),
            const SizedBox(height: 20),
            MoviesOverview(overview: movie.overview),
          ],
        ),
      ),
      bottomNavigationBar: NaveButton(movie: movie,),
      backgroundColor: Colors.white,
    );
  }
}













