import 'package:flutter/material.dart';
import 'package:tmdb_app/screen/FavoritesItem.dart';
import '../sevice/Movie.dart';
import '../sevice/CrudMovie.dart';
import 'MoviesScreen.dart';

class Favorites extends StatefulWidget {
  // final List<Movie> movies;

  const Favorites({super.key});

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text('Favorites')) , 
      body: FavoriteMovieList(),
      );
  }
}

class FavoriteMovieList extends StatefulWidget {
  @override
  _FavoriteMovieListState createState() => _FavoriteMovieListState();
}

class _FavoriteMovieListState extends State<FavoriteMovieList> {
  List<Movie> _favoriteMovies = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadFavoriteMovies();
  }

  Future<void> _loadFavoriteMovies() async {
    List<Movie> movies = await MovieDatabase().getMovies();
    setState(() {
      _favoriteMovies = movies;
      _loading = false; 
    });
  }
  @override
  Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
    child: _loading
        ? Center(child: CircularProgressIndicator())
        : ListView(
            children: _favoriteMovies
                .map((movie) => FavoriteMovieItem(movie: movie))
                .toList(),
          ),
  );
}

}

class FavoriteMovieItem extends StatelessWidget {
  final Movie movie;

  const FavoriteMovieItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MoviesScreen(movie: movie),
          ),
        );
      },
      child: Column(
        children: [
          const SizedBox(height: 10),
          Favoritesitem(movie: movie),
          const SizedBox(height: 10),
          Divider(
            color: Colors.grey,
            height: 1,
          ),
        ],
      ),
    );
   
  }
}

