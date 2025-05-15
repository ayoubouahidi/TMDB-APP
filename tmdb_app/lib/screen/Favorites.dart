import 'package:flutter/material.dart';
import '../sevice/Movie.dart';
import '../sevice/CrudMovie.dart';

class Favorites extends StatefulWidget {
  // final List<Movie> movies;

  const Favorites({super.key});

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Favorites')));
  }
}

