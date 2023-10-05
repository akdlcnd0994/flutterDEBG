import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(
              Icons.home,
              color: Colors.black,
            ),
            title: const Text(
              'Home',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              print("Home is Clicked");
            },
            trailing: const Icon(Icons.add),
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            title: const Text(
              'Setting',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              print('Setting is clicked');
            },
            trailing: const Icon(Icons.add),
          ),
          ListTile(
            leading: const Icon(
              Icons.question_answer,
              color: Colors.black,
            ),
            title: const Text(
              'Q&A',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              print('Q&A is clicked');
            },
            trailing: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
