import 'package:flutter/material.dart';
import 'package:travel_app/ui/Hotel/search_room.dart';
import 'package:travel_app/ui/Login/forgotpw.dart';
import 'package:travel_app/ui/Login/login.dart';
import 'package:travel_app/ui/Login/signin.dart';
import 'package:travel_app/ui/Login/signup.dart';
import 'ui/homepage.dart'; // Import homepage.dart from ui folder

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchRoom(), // Set Homepage as the initial screen
    );
  }
}
