import 'package:flutter/material.dart';
import 'MoviesScreen.dart';
import '../sevice/Movie.dart';


class myHomePage extends StatefulWidget {
  const myHomePage({super.key});

  @override
  State<myHomePage> createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {
  int _selectedIndex = 0;

  void _changeIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(), // Use the app bar properly in Scaffold
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(top: 10), // Adjust padding instead of Stack
        children: [
          HomeTrendingsBuilder(title: "some project 1"),
          HomeTrendingsBuilder(title: "some project 2"),
          HomeTrendingsBuilder(title: "some project 3"),
          HomeTrendingsBuilder(title: "some project 4"),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Color.fromARGB(255, 247, 92, 28),
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
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    
    return AppBar(
      backgroundColor: Colors.blue,
      elevation: 4,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context); 
        },
        icon: const Icon(Icons.arrow_back),
      ),
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 47,top: 8),
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
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
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
                        image: AssetImage(
                          "assets/ofppt.png",
                        ),
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

  const HomeTrendingsBuilder({Key? key, required this.title}) : super(key: key);

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
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                // أنشئ كائن Movie وهمي
                final movie = Movie(
                  adult: true,
                  original_title: "Movie $index",
                  poster_path: "https://i.pinimg.com/originals/e9/77/ec/e977ec8256a7b1f68c8671327434dba9.jpg",
                  overview: "This is a overview  movie $index dsoijcio idshcdc odsoic sdco sdhc sdohcpsdohcphsashad vpadp vahpavhapv asvpsadhvp asvphv pahpv haphvps vpashvp apsvhpahv ap vaph vaphvaphv ashspvih vhasdvhhvsiuh sdjvapush vjhs vhu",
                  release_date: "2023-10-01",
                  title: "Movie Title $index",
                  vote_average: 9.0,
                  vote_count: 100,
                  backdrop: "https://i.pinimg.com/originals/e9/77/ec/e977ec8256a7b1f68c8671327434dba9.jpg",
                  popularity: "1000",

                );

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MoviesScreen(movie: movie),
                      ),
                    );
                  },
                  child: Container(
                    width: 120,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(movie.poster_path!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(4),
                        color: Colors.black54,
                        child: Text(
                          movie.original_title ?? "",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
