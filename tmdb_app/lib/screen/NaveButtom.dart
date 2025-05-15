import 'package:flutter/material.dart';
import 'package:tmdb_app/sevice/Movie.dart';
import '../sevice/CrudMovie.dart';


class NaveButton extends StatefulWidget {
  final Movie? movie;
  const NaveButton({Key? key, required this.movie}) : super(key: key);

  @override
  _NaveButtonState createState() => _NaveButtonState();
}

class _NaveButtonState extends State<NaveButton> {
  bool _exists = false;
  bool _loading = true;


  @override
  void initState() {
    super.initState();
    _checkMovieExists();
  }

  Future<void> _checkMovieExists() async {
    bool exists = await MovieDatabase().isMovieExists(widget.movie?.id);
    setState(() {
      _exists = exists;
      _loading = false;
    });
  }

  Future<void> _toggleFavorite() async {
    setState(() {
      _loading = true;
    });
    if (_exists) {
      await MovieDatabase().deleteMovie(widget.movie?.id);
    } else {
      await MovieDatabase().insertMovie(widget.movie!);
    }
    setState(() {
      _exists = !_exists;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // Watch Now action
              },
              child: const Text("Watch Now"),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                _toggleFavorite();
              },
              child: _loading
                  ? const CircularProgressIndicator()
                  : Text(_exists ? "Remove from Favorites" : "Add to Favorites"),
            ),
          ),
        ],
      ),
    );
  }
}


