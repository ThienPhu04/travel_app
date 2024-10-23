import 'package:flutter/material.dart';
import 'package:travel_app/ui/Hotel/detail_Hotel.dart';
import 'package:travel_app/ui/Hotel/search_room.dart';
import 'package:travel_app/ui/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(), // Set Homepage as the initial screen
    );
  }
}
