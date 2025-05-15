// import 'package:flutter/material.dart';

// import 'package:tmdb_app/sevice/Movie.dart';
// import 'package:tmdb_app/Api/api.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:google_fonts/google_fonts.dart';

// import 'package:tmdb_app/screen/MoviesScreen.dart';
// import 'package:tmdb_app/screen/SearchBar.dart';
// import 'package:tmdb_app/screen/Favorites.dart';

// class MyHomePage extends StatefulWidget {
//   // PascalCase naming
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _selectedIndex = 0;
//   late Future<List<Movie>> _moviesPopulaire;

//   final List<Widget> _pages = [
//     const homePageContent(),
//     Searchbar(), // We'll extract the home content to a separate widget
//     Favorites(),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _moviesPopulaire = Api().getPopulaire();
//   }

//   void _changeIndex(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: HomeAppBar(),
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.blue,
//         selectedItemColor: const Color.fromARGB(255, 247, 92, 28),
//         currentIndex: _selectedIndex,
//         onTap: _changeIndex,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home, color: Colors.black, size: 32),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search, color: Colors.black, size: 32),
//             label: "recherche",
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

// class homePageContent extends StatelessWidget {
//   const homePageContent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       physics: const BouncingScrollPhysics(),
//       padding: const EdgeInsets.only(top: 10),
//       children: [
//         const Center(
//           child: Padding(
//             padding: EdgeInsets.symmetric(vertical: 5),
//             child: Text(
//               "Upcommig",
//               style: TextStyle(
//                 fontSize: 24, // Slightly larger font
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//         ),
//         FutureBuilder(
//           future: Api().getPopulaire(),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               return const Center(child: CircularProgressIndicator());
//             }
//             final movies = snapshot.data!;

//             return CarouselSlider.builder(
//               itemCount: movies.length,
//               itemBuilder: (context, index, movieIndex) {
//                 final movie = movies[index];
//                 return Container(
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Image.network(
//                     "https://image.tmdb.org/t/p/original/${movie.backdrop}",
//                   ),
//                 );
//               },
//               options: CarouselOptions(
//                 autoPlay: true,
//                 enlargeCenterPage: true,
//                 aspectRatio: 1.4,
//                 autoPlayInterval: const Duration(seconds: 3),
//               ),
//             );
//           },
//         ),
//         HomeTrendingsBuilder(
//           title: "Popular Movies",
//           moviesFuture: Api().getPopulaire(),
//         ),
//         HomeTrendingsBuilder(
//           title: "Top  Rated",
//           moviesFuture: Api().getTopRated())
//       ],
//     );
//   }
// }

// class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
//   HomeAppBar({super.key}); // Added constructor

//   final TextEditingController _controller = TextEditingController();

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: Colors.blue,
//       elevation: 4,
//       automaticallyImplyLeading: false,
//       leading: IconButton(
//         onPressed: () => Navigator.pop(context),
//         icon: const Icon(Icons.home),
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
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Center(
//                     child:Text('TMDB APP',
//                   style: GoogleFonts.poppins(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: const Color.fromARGB(255, 255, 255, 255),
//                   ),) ,
//                   )  
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
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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

//   scrollDirection: Axis.horizontal,
//   itemCount: movies.length,
//   itemBuilder: (context, index) {
//     final movie = movies[index];
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => MoviesScreen(movie: movie),
//           ),
//         );
//       },
//       child: Container(
//         width: 120,
//         margin: const EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           color: Colors.grey[300],
//           borderRadius: BorderRadius.circular(10),
//           image: movie.poster_path != null
//               ? DecorationImage(
//                   image: NetworkImage(
//                     'https://image.tmdb.org/t/p/w500${movie.poster_path}',
//                   ),
//                   fit: BoxFit.cover,
//                 )
//               : null,
//         ),
//         child: movie.poster_path == null
//             ? const Center(child: Icon(Icons.movie))
//             : null,
//       ),
//     );
//     },
//   );
//  },

//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
