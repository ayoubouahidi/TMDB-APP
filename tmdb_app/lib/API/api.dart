
import 'package:flutter/material.dart';
import 'package:tmdb_app/sevice/Movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  String populaire = "https://api.themoviedb.org/3/movie/popular?api_key=caf4689749740a324bfd12b6a9c57435";

  Future<List<Movie>> getPopulaire() async {
    var response = await http.get(Uri.parse(populaire));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Movie> movies = [];
      for (var item in data['results']) {
        movies.add(Movie.fromJson(item));
      }
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
