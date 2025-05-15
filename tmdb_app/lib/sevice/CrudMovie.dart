import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tmdb_app/sevice/Movie.dart';


class MovieDatabase {
  static final MovieDatabase _instance = MovieDatabase._internal();

  factory MovieDatabase() {
    return _instance;
  }

  MovieDatabase._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'movies.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE movies (
                adult INTEGER,                     
                backdrop TEXT,
                original_language TEXT,
                original_title TEXT,
                overview TEXT,
                release_date TEXT,
                title TEXT,
                poster_path TEXT,
                media_type TEXT,
                id TEXT PRIMARY KEY,               
                popularity TEXT,
                vote_average REAL,                
                vote_count INTEGER,
                video TEXT                
              );

        ''');
      },
    );
    }

    Future<int> insertMovie(Movie movie) async {
      final db = await this.db;
      return await db.insert(
        'movies',
        movie.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    Future<bool> isMovieExists(String? id) async {
      final db = await this.db;
      final List<Map<String, dynamic>> maps = await db.query(
        'movies',
        where: 'id = ?',
        whereArgs: [id],
      );
      return maps.isNotEmpty;
    }

    Future<List<Movie>> getMovies() async {
      final db = await this.db;
      final List<Map<String, dynamic>> maps = await db.query('movies');
      return List.generate(maps.length, (i) {
        return Movie.fromMapSqfLite(maps[i]);
      });
    }

    Future<int> deleteMovie(String? id) async {
      final db = await this.db;
      return await db.delete(
        'movies',
        where: 'id = ?',
        whereArgs: [id],
      );
    }


 
}