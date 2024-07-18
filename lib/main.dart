import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/firebase_options.dart';
import 'package:portfolio/web/about_page.dart';
import 'package:portfolio/web/blog_page.dart';
import 'package:portfolio/web/contact_page.dart';
import 'package:portfolio/web/landing_page_web.dart';
import 'package:portfolio/web/project_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //GoogleFonts.config.allowRuntimeFetching = false;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        //'/Blog': (_) => const BlogPage(),
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