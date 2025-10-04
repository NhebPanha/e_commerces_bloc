import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("data")),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "profile"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "favorite"),
      ]),
    );
  }
}