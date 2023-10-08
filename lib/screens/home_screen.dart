import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 12,
        titleSpacing: 10,
        backgroundColor: Colors.purple[300],
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
        ),
        leadingWidth: 10,
        title: const ListTile(
          title: Text(
            'Home',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Row(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
