import 'package:flutter/material.dart';

class healthCheckScreen extends StatelessWidget {
  const healthCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height; // 화면의 높이
    double width = MediaQuery.of(context).size.width; // 화면의 가로
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 0,
        titleSpacing: 10,
        backgroundColor: Colors.teal[400],
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
        ),
        leadingWidth: 10,
        title: const ListTile(
          title: Text(
            '문진',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.savings,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: height * 0.1,
                  ),
                  Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    height: height * 0.4,
                    width: width * 0.7,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
