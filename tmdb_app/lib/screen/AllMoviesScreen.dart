import 'package:flutter/material.dart';
import 'package:tmdb_app/sevice/Movie.dart';
import 'package:tmdb_app/screen/MoviesScreen.dart';

class AllMoviesScreen extends StatefulWidget {
  final String categoryTitle;
  final Future<List<Movie>> moviesFuture;

  const AllMoviesScreen({
    super.key,
    required this.categoryTitle,
    required this.moviesFuture,
  });

  @override
  State<AllMoviesScreen> createState() => _AllMoviesScreenState();
}

class _AllMoviesScreenState extends State<AllMoviesScreen> {
  late Future<List<Movie>> _movies;
  String _selectedFilter = "All";
  final List<String> _filters = ["All", "Rating ↑", "Rating ↓", "Title A-Z", "Title Z-A"];
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  String _searchQuery = "";
  
  @override
  void initState() {
    super.initState();
    _movies = widget.moviesFuture;
  }

  void _filterMovies(List<Movie> movies) { 
    switch (_selectedFilter) {
      case "Rating ↑":
        movies.sort((a, b) => 
          (a.vote_average ?? 0).compareTo(b.vote_average ?? 0));
        break;
      case "Rating ↓":
        movies.sort((a, b) => 
          (b.vote_average ?? 0).compareTo(a.vote_average ?? 0));
        break;
      case "Title A-Z":
        movies.sort((a, b) => 
          (a.title ?? "").compareTo(b.title ?? ""));
        break;
      case "Title Z-A":
        movies.sort((a, b) => 
          (b.title ?? "").compareTo(a.title ?? ""));
        break;
      default:
        // Keep original order
        break;
    }
  }

  List<Movie> _searchMovies(List<Movie> movies) {
    if (_searchQuery.isEmpty) return movies;
    
    return movies.where((movie) => 
      (movie.title ?? "").toLowerCase().contains(_searchQuery.toLowerCase())
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1321),
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            _buildFilterSection(),
            Expanded(
              child: _buildMoviesGrid(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          if (!_isSearching)
            Expanded(
              child: Text(
                widget.categoryTitle,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          if (_isSearching)
            Expanded(
              child: TextField(
                controller: _searchController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Search movies...",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
                autofocus: true,
              ),
            ),
          IconButton(
            icon: Icon(
              _isSearching ? Icons.close : Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _searchController.clear();
                  _searchQuery = "";
                }
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          const Text(
            "Filter by:",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: DropdownButtonHideUnderline(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFF1D2D44),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButton<String>(
                  value: _selectedFilter,
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                  dropdownColor: const Color(0xFF1D2D44),
                  isExpanded: true,
                  style: const TextStyle(color: Colors.white),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _selectedFilter = newValue;
                      });
                    }
                  },
                  items: _filters.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMoviesGrid() {
    return FutureBuilder<List<Movie>>(
      future: _movies,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xFF3E92CC)),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 48),
                const SizedBox(height: 16),
                Text(
                  "Error loading movies: ${snapshot.error}",
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _movies = widget.moviesFuture;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3E92CC),
                  ),
                  child: const Text("Retry"),
                ),
              ],
            ),
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.movie,
                  color: Colors.white54,
                  size: 48,
                ),
                const SizedBox(height: 16),
                const Text(
                  "No movies found",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          );
        }

        List<Movie> movies = List.from(snapshot.data!);
        _filterMovies(movies);
        List<Movie> filteredMovies = _searchMovies(movies);

        if (filteredMovies.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.search_off,
                  color: Colors.white54,
                  size: 48,
                ),
                const SizedBox(height: 16),
                Text(
                  "No movies found matching \"$_searchQuery\"",
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          );
        }

        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: filteredMovies.length,
          itemBuilder: (context, index) {
            final movie = filteredMovies[index];
            return _buildMovieCard(context, movie);
          },
        );
      },
    );
  }

  Widget _buildMovieCard(BuildContext context, Movie movie) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MoviesScreen(movie: movie),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1D2D44),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    movie.poster_path != null
                        ? Image.network(
                            'https://image.tmdb.org/t/p/w500${movie.poster_path}',
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                color: const Color(0xFF1D2D44),
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: Color(0xFF3E92CC),
                                  ),
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: const Color(0xFF1D2D44),
                                child: const Center(
                                  child: Icon(
                                    Icons.movie,
                                    color: Colors.white54,
                                    size: 32,
                                  ),
                                ),
                              );
                            },
                          )
                        : Container(
                            color: const Color(0xFF1D2D44),
                            child: const Center(
                              child: Icon(
                                Icons.movie,
                                color: Colors.white54,
                                size: 32,
                              ),
                            ),
                          ),
                    if (movie.vote_average != null)
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 14,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "${movie.vote_average?.toStringAsFixed(1)}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title ?? "Unknown",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (movie.release_date != null && movie.release_date!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        movie.release_date!.split('-')[0], // Just the year
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 12,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}