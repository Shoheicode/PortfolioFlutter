import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/firebase_options.dart';
import 'package:portfolio/mobile/landing_page_mobile.dart';
import 'package:portfolio/routes.dart';
import 'package:portfolio/web/landing_page_web.dart';

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
        // routes:{
        //   //'/': (_) => const LandingPageWeb(),
        //   '/About': (_) => const AboutWeb(),
        //   '/Projects': (_) => const ProjectPageWeb(),
        //   '/Contact': (_) =>const ContactWeb(),
        // },
        onGenerateRoute: (settings) => Routes.generatorRoute(settings),
        //initialRoute: '/',
        title: "Jason Irie",
        home: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return const LandingPageWeb();
            } else {
              return const LandingPageMobile();
            }
          },
        ));
  }
}
