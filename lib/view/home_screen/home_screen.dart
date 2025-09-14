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
      body: Column(
        children: [
        //   CustomAppbar(title: 'Locations', icons: Icons.location_on, descriptions: "Cambodia", iconNotification: Icons.notification_important_sharp,),
        //   CustomSearchWidget(title: 'Search', icons: Icons.search,),
        ]
      )
    );
  }
}