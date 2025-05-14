import 'package:flutter/material.dart';

import 'package:tmdb_app/sevice/Movie.dart';
import 'package:tmdb_app/Api/api.dart';
import 'package:carousel_slider/carousel_slider.dart';


// class myHomePage extends StatefulWidget {
//   const myHomePage({super.key});

//   @override
//   State<myHomePage> createState() => _myHomePageState();
// }

// class _myHomePageState extends State<myHomePage> {
//   int _selectedIndex = 0;
//   List<Movie> _movies = [];
//   // late Future<List<Movie>> _moviesPopulaire;

//   void _changeIndex(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _moviesPopulaire = Api().getPopulaire();
//   //   _moviesPopulaire.then((movies) {
//   //     for (var movie in movies) {
//   //     print("Movie: ${movie.title}");
//   //     }
//   //   }).catchError((error) {
//   //     print("Error fetching movies: $error");
//   //   });
//   // }

//   Future<void> _loadMovies() async {
//     final _moviesPopulaire = await Api().getPopulaire();
//     setState(() {
//       _movies = _moviesPopulaire;
//       print("movie ==> ${_movies}");
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: HomeAppBar(), // Use the app bar properly in Scaffold
//       body: ListView(
//         physics: const BouncingScrollPhysics(),
//         padding: const EdgeInsets.only(
//           top: 10,
//         ), // Adjust padding instead of Stack
//         children: [
//           // Debugging statement moved to initState or removed
//           HomeTrendingsBuilder(
//             title: "Populair Movies", // Ensure this is a valid String
//             moviesFuture: _movies,
//           ),
//           // HomeTrendingsBuilder(title: "some project 2"),
//           // HomeTrendingsBuilder(title: "some project 3"),
//           // HomeTrendingsBuilder(title: "some project 4"),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.blue,
//         selectedItemColor: Color.fromARGB(255, 247, 92, 28),
//         currentIndex: _selectedIndex,
//         onTap: _changeIndex,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home, color: Colors.black, size: 32),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite, color: Colors.black, size: 32),
//             label: "Favorites",
//           ),
//         ],
//       ),
//     );
//   }
// }

// class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController _controller = TextEditingController();

//     return AppBar(
//       backgroundColor: Colors.blue,
//       elevation: 4,
//       automaticallyImplyLeading: false,
//       leading: IconButton(
//         onPressed: () {
//           Navigator.pop(context);
//         },
//         icon: const Icon(Icons.arrow_back),
//       ),
//       flexibleSpace: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 47, top: 8),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Container(
//                   height: 35,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: TextField(
//                     controller: _controller,
//                     decoration: InputDecoration(
//                       hintText: "Search...",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(40),
//                       ),
//                       contentPadding: const EdgeInsets.symmetric(
//                         vertical: 0,
//                         horizontal: 10,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 10),
//               TextButton(
//                 onPressed: () {},
//                 child: const CircleAvatar(
//                   backgroundColor: Colors.white,
//                   radius: 20,
//                   child: Image(
//                     image: AssetImage("assets/ofppt.png"),
//                     height: 30,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class HomeTrendingsBuilder extends StatelessWidget {
//   final String title;
//   final List<Movie> moviesFuture;

//   const HomeTrendingsBuilder({
//     Key? key,
//     required this.title,
//     required this.moviesFuture,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: Text(
//               title,
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//           ),
//           SizedBox(
//             height: 200,
//             child: ListView.builder(
//               itemCount: moviesFuture.length,
//               itemBuilder: (context, index) {
//                 final movie = moviesFuture[index];
//                 return ListTile(
//                   title: Text(movie.title.toString()),
//                   leading: Image.network(
//                     'https://image.tmdb.org/t/p/w500${movie.poster_path}',
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:tmdb_app/sevice/Movie.dart';
// // import 'package:tmdb_app/Api/api.dart';

// // class MyHomePage extends StatefulWidget {  // PascalCase naming
// //   const MyHomePage({super.key});

// //   @override
// //   State<MyHomePage> createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   int _selectedIndex = 0;
// //   late Future<List<Movie>> _moviesPopulaire;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _moviesPopulaire = Api().getPopulaire();
// //   }

// //   void _changeIndex(int index) {
// //     setState(() {
// //       _selectedIndex = index;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: HomeAppBar(),
// //       body: ListView(
// //         physics: const BouncingScrollPhysics(),
// //         padding: const EdgeInsets.only(top: 10),
// //         children: [
// //           HomeTrendingsBuilder(
// //             title: "Popular Movies",
// //             moviesFuture: _moviesPopulaire,
// //           ),
// //         ],
// //       ),
// //       bottomNavigationBar: BottomNavigationBar(
// //         backgroundColor: Colors.blue,
// //         selectedItemColor: const Color.fromARGB(255, 247, 92, 28),
// //         currentIndex: _selectedIndex,
// //         onTap: _changeIndex,
// //         items: const <BottomNavigationBarItem>[
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.home, color: Colors.black, size: 32),
// //             label: "Home",
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.favorite, color: Colors.black, size: 32),
// //             label: "Favorites",
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
// //   HomeAppBar({super.key});  // Added constructor
  
// //   final TextEditingController _controller = TextEditingController();

// //   @override
// //   Size get preferredSize => const Size.fromHeight(kToolbarHeight);

// //   @override
// //   Widget build(BuildContext context) {
// //     return AppBar(
// //       backgroundColor: Colors.blue,
// //       elevation: 4,
// //       automaticallyImplyLeading: false,
// //       leading: IconButton(
// //         onPressed: () => Navigator.pop(context),
// //         icon: const Icon(Icons.arrow_back),
// //       ),
// //       flexibleSpace: SafeArea(
// //         child: Padding(
// //           padding: const EdgeInsets.only(left: 47, top: 8),
// //           child: Row(
// //             children: [
// //               Expanded(
// //                 child: Container(
// //                   height: 35,
// //                   decoration: BoxDecoration(
// //                     color: Colors.grey[200],
// //                     borderRadius: BorderRadius.circular(20),
// //                   ),
// //                   child: TextField(
// //                     controller: _controller,
// //                     decoration: InputDecoration(
// //                       hintText: "Search...",
// //                       border: InputBorder.none,  // Removes default border
// //                       contentPadding: const EdgeInsets.symmetric(
// //                         vertical: 0,
// //                         horizontal: 10,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(width: 10),
// //               TextButton(
// //                 onPressed: () {},
// //                 child: const CircleAvatar(
// //                   backgroundColor: Colors.white,
// //                   radius: 20,
// //                   child: Image(
// //                     image: AssetImage("assets/ofppt.png"),
// //                     height: 30,
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// class HomeTrendingsBuilder extends StatelessWidget {
//   final String title;
//   final Future<List<Movie>> moviesFuture;

//   const HomeTrendingsBuilder({
//     super.key,
//     required this.title,
//     required this.moviesFuture,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 200,
//             child: FutureBuilder<List<Movie>>(
//               future: moviesFuture,
//               builder: (context, snapshot) {
//                 // Handle loading state
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 }

//                 // Handle error state
//                 if (snapshot.hasError) {
//                   return Center(child: Text("Error: ${snapshot.error}"));
//                 }

//                 // Handle empty or null data
//                 if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                   return const Center(child: Text("No movies found"));
//                 }

//                 final movies = snapshot.data!;
//                 return ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: movies.length,
//                   itemBuilder: (context, index) {
//                     final movie = movies[index];
//                     return Container(
//                       width: 120,
//                       margin: const EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         color: Colors.grey[300],  // Fallback if no poster
//                         borderRadius: BorderRadius.circular(10),
//                         image: movie.poster_path != null
//                             ? DecorationImage(
//                                 image: NetworkImage(
//                                   'https://image.tmdb.org/t/p/original/${movie.backdrop ?? ''}',
//                                 ),
//                                 fit: BoxFit.cover,
//                               )
//                             : null,
//                       ),
//                       child: movie.poster_path == null
//                           ? const Center(child: Icon(Icons.movie))
//                           : null,
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:tmdb_app/API/api.dart';
// import 'package:tmdb_app/sevice/Movie.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   // late Future<List<Movie>> upcomingMovies;
//   late Future<List<Movie>> popularMovies;
//   // late Future<List<Movie>> topRatedMovies;

//   @override
//   void initState() {
//     // upcomingMovies = Api().getUpcomingMovies();
//     popularMovies = Api().getPopulaire();
//     popularMovies.then((movies) {
//     print("Movies fetched: ${movies.length}");
//   }).catchError((error) {
//     print("Error fetching movies: $error");
//   });
//     // topRatedMovies = Api().getTopRatedMovies();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black12,
//       appBar: AppBar(
//         backgroundColor: Colors.black12,
//         foregroundColor: Colors.white,
//         leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
//         title: const Text("Show Spot"),
//         centerTitle: true,
//         actions: [
//           IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded)),
//           IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Upcoming',
//                 style: TextStyle(color: Colors.white),
//               ),
//               //Carousel
//               FutureBuilder(
//                 future: popularMovies,
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                   final movies = snapshot.data!;

//                   return CarouselSlider.builder(
//                     itemCount: movies.length,
//                     itemBuilder: (context, index, movieIndex) {
//                       final movie = movies[index];
//                       return Container(
//                         width: double.infinity,
//                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
//                         child: Image.network("https://image.tmdb.org/t/p/original/${movie.backdrop}"),
//                       );
//                     },
//                     options: CarouselOptions(
//                         autoPlay: true,
//                         enlargeCenterPage: true,
//                         aspectRatio: 1.4,
//                         autoPlayInterval: const Duration(seconds: 3)),
//                   );
//                 },
//               ),

//               //Popular Movies
//               const Text(
//                 'Popular',
//                 style: TextStyle(color: Colors.white),
//               ),
//               Container(
//                 margin: const EdgeInsets.symmetric(vertical: 20),
//                 height: 200,
//                 child: FutureBuilder(
//                   future: popularMovies,
//                   builder: (context, snapshot) {
//                     if (!snapshot.hasData) {
//                       return const Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }

//                     final movies = snapshot.data!;
//                     return ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: movies.length,
//                       itemBuilder: (context, index) {
//                         final movie = movies[index];

//                         return Container(
//                           width: 150,
//                           margin: const EdgeInsets.symmetric(horizontal: 10),
//                           decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(15),
//                             child: Image.network(
//                               "https://image.tmdb.org/t/p/original/${movie.backdrop}",
//                               height: 120,
//                               width: double.infinity,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),

//               const Text(
//                 'Top Rated',
//                 style: TextStyle(color: Colors.white),
//               ),
//               Container(
//                 margin: const EdgeInsets.symmetric(vertical: 20),
//                 height: 200,
//                 child: FutureBuilder(
//                   future: popularMovies,
//                   builder: (context, snapshot) {
//                     if (!snapshot.hasData) {
//                       return const Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }

//                     final movies = snapshot.data!;
//                     return ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: movies.length,
//                       itemBuilder: (context, index) {
//                         final movie = movies[index];

//                         return Container(
//                           width: 150,
//                           margin: const EdgeInsets.symmetric(horizontal: 10),
//                           decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(15),
//                             child: Image.network(
//                               "https://image.tmdb.org/t/p/original/${movie.backdrop}",
//                               height: 120,
//                               width: double.infinity,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:tmdb_app/sevice/Movie.dart';
import 'package:tmdb_app/Api/api.dart';

class MyHomePage extends StatefulWidget {  // PascalCase naming
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  late Future<List<Movie>> _moviesPopulaire;

  @override
  void initState() {
    super.initState();
    _moviesPopulaire = Api().getPopulaire();
  }

  void _changeIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(top: 10),
        children: [
          const Center(
                  child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: Text(
                    "Upcommig",
                    style: TextStyle(fontSize: 24, // Slightly larger font
                      fontWeight: FontWeight.bold,
                      color: Colors.black,),
                  ),
                ),

          ),
                FutureBuilder(
                future: _moviesPopulaire,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final movies = snapshot.data!;

                  return CarouselSlider.builder(
                    itemCount: movies.length,
                    itemBuilder: (context, index, movieIndex) {
                      final movie = movies[index];
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                        child: Image.network("https://image.tmdb.org/t/p/original/${movie.backdrop}"),
                      );
                    },
                    options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 1.4,
                        autoPlayInterval: const Duration(seconds: 3)),
                  );
                },
              ),
          HomeTrendingsBuilder(
            title: "Popular Movies",
            moviesFuture: _moviesPopulaire,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: const Color.fromARGB(255, 247, 92, 28),
        currentIndex: _selectedIndex,
        onTap: _changeIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black, size: 32),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.black, size: 32),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  HomeAppBar({super.key});  // Added constructor
  
  final TextEditingController _controller = TextEditingController();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      elevation: 4,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back),
      ),
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 47, top: 8),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Search...",
                      border: InputBorder.none,  // Removes default border
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 10,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              TextButton(
                onPressed: () {},
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: Image(
                    image: AssetImage("assets/ofppt.png"),
                    height: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class HomeTrendingsBuilder extends StatelessWidget {
  final String title;
  final Future<List<Movie>> moviesFuture;

  const HomeTrendingsBuilder({
    super.key,
    required this.title,
    required this.moviesFuture,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: FutureBuilder<List<Movie>>(
              future: moviesFuture,
              builder: (context, snapshot) {
                // Handle loading state
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                // Handle error state
                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }

                // Handle empty or null data
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("No movies found"));
                }

                final movies = snapshot.data!;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    return Container(
                      width: 120,
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],  // Fallback if no poster
                        borderRadius: BorderRadius.circular(10),
                        image: movie.poster_path != null
                            ? DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500${movie.poster_path}',
                                ),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: movie.poster_path == null
                          ? const Center(child: Icon(Icons.movie))
                          : null,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
