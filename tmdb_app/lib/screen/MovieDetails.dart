import 'package:flutter/material.dart';
import '../sevice/Movie.dart';
import 'MovieImage.dart';
import 'MovieRatingStars.dart';


class MovieDetails extends StatelessWidget {
  final Movie movie;

  const MovieDetails({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0), 
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(movie.backdrop.toString()),
            fit: BoxFit.cover,
             colorFilter: ColorFilter.mode(
           Colors.black.withOpacity(0.8), 
             BlendMode.darken, 
      ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MovieImage(movie: movie),
            Text(
            movie.original_title ?? "Unknown Title", 
            style: const TextStyle(
              fontSize: 24,
               fontWeight: FontWeight.bold,
               color: Colors.white
               ),
          ),
          Text(
            movie.release_date ?? "Unknown Release Date", 
            style: const TextStyle(
              fontSize: 16 , 
              color: Colors.white),
          ),
          Text(
            "Popularity: ${movie.popularity}", 
            style: const TextStyle(
            fontSize: 16,
            color: Colors.white
            ),
          ),
          MovieRatingStars(voteAverage: movie.vote_average),
           
          ],
        ),
      ),
     );
  }
}

