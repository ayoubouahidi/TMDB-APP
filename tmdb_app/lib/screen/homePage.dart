import 'package:flutter/material.dart';


class myHomePage  extends StatelessWidget{
  const myHomePage({super.key});
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
                          "assets/icons/ofppt.png",
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
                return Container(
                  width: 120,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
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