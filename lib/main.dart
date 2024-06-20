import 'package:flutter/material.dart';
import 'package:portfolio/web/about_page.dart';
import 'package:portfolio/web/blog_page.dart';
import 'package:portfolio/web/contact_page.dart';
import 'package:portfolio/web/landing_page_web.dart';
import 'package:portfolio/web/project_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
        //'/': (_) => const LandingPageWeb(),
        '/About': (_) => const AboutWeb(),
        '/Projects': (_) => const ProjectPageWeb(),
        '/Blog': (_) => BlogPage(),
        '/Contact': (_) =>const ContactWeb(),
      },
      //initialRoute: '/',
      title: "Jason Irie",
      home: LayoutBuilder(
        builder: (context, constraints){
          return const LandingPageWeb();
        },
      )
    );
  }
}