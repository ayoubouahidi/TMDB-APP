import 'package:flutter/material.dart';
import '../sevice/Movie.dart';



class MovieImage extends StatelessWidget {
final Movie movie;

const MovieImage({Key? key, required this.movie}) : super(key: key);

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
image: NetworkImage(movie.poster_path.toString()),
fit: BoxFit.cover,
),
),
),
if (movie.adult == true)
Positioned(
top: 10,
right: 10,
child: Container(
padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
decoration: BoxDecoration(
color: const Color.fromARGB(255, 255, 0, 0).withOpacity(0.7),
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
