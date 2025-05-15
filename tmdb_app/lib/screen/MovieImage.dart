import 'package:flutter/material.dart';
import '../sevice/Movie.dart';
import '../sevice/CrudMovie.dart';

class MovieImage extends StatefulWidget {
  final Movie movie;
  const MovieImage({Key? key, required this.movie}) : super(key: key);
  @override
  State<MovieImage> createState() => _MovieImageState();
}

class _MovieImageState extends State<MovieImage> {
  bool isFavorite = false;
  bool loading = true;
  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
  }

  Future<void> _checkIfFavorite() async {
    bool exists = await MovieDatabase().isMovieExists(widget.movie.id);
    setState(() {
      isFavorite = exists;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(
                  "https://image.tmdb.org/t/p/w500${widget.movie.poster_path}",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (widget.movie.adult == true)
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  '+18',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          
        ],
      ),
    );
  }
}
