import 'package:flutter/material.dart';
import 'package:portfolio/web/landing_page_web.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Jason Irie",
      home: LayoutBuilder(
        builder: (context, constraints){
          return const LandingPageWeb();
        },
      )
    );
  }
}