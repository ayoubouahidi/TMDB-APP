import 'package:flutter/material.dart';
import '../sevice/Movie.dart';
import '../sevice/CrudMovie.dart';


class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Center(
        child: Text('Your favorite movies will appear here.'),
      ),
    );
  }
}