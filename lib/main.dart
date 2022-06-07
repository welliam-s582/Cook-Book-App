import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Cook Book",
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: HomePage(),
    );
  }
}
