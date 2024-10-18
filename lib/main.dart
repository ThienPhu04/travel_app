import 'package:flutter/material.dart';
import 'package:travel_app/ui/login.dart';
import 'ui/homepage.dart'; // Import homepage.dart from ui folder

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(), // Set Homepage as the initial screen
    );
  }
}
