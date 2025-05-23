import 'package:flutter/material.dart';
import 'package:tmdb_app/sevice/Movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  String populaire =
      "https://api.themoviedb.org/3/movie/popular?api_key=caf4689749740a324bfd12b6a9c57435";
  String topRated = "https://api.themoviedb.org/3/movie/top_rated";

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

  Future<List<Movie>> getTopRated() async {
    var response = await http.get(Uri.parse(topRated));
    if (response.statusCode == 200)   {
      var data = json.decode(response.body);
      List<Movie> movie = [];
      for (var item in data['results']) {
        movie.add(Movie.fromJson(item));
      }
      return movie;
    } else {
      throw Exception("Failed to load movies");
    }
  }

static Future<List<Movie>> searchMovies(String query, {int page = 1}) async {
    final data = await http.get(
      Uri.parse('https://api.themoviedb.org/3/search/movie?api_key=caf4689749740a324bfd12b6a9c57435&query=$query'),
    );
    var data2=json.decode(data.body);
    // print(data2);
    return (data2['results'] as List)
        .map((movie) => Movie.fromJson(movie))
        .toList();
}



}
