import 'package:flutter/material.dart';


class NaveButtom extends StatelessWidget {
  const NaveButtom({Key? key}) : super(key: key);

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
              onPressed: () {},
              child: const Text("Watch Now"),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Add to Favorites"),
            ),
          ),       
        ],
      ),
    );
  }
}

