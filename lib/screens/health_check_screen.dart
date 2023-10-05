import 'package:flutter/material.dart';

class healthCheckScreen extends StatelessWidget {
  const healthCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: const Text(
          'Page 2',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
