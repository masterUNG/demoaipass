import 'package:flutter/material.dart';

class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Home'),
      ),
      body: Center(
        child: Text('Welcome to the Main Home Screen'),
      ),
    );
  }
}