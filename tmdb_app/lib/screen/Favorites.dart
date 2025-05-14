import 'package:flutter/material.dart';
import '../sevice/Movie.dart';
import '../sevice/CrudMovie.dart';


class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

   List<Movie> movies = [];

  const Favorites({Key? key, required this.movies}) : super(key: key);


  @override
}