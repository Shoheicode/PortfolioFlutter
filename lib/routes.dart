import 'package:flutter/material.dart';
import 'package:portfolio/mobile/about_page_mobile.dart';
import 'package:portfolio/mobile/landing_page_mobile.dart';
import 'package:portfolio/mobile/project_page_mobile.dart';
import 'package:portfolio/web/about_page.dart';
import 'package:portfolio/web/landing_page_web.dart';
import 'package:portfolio/web/project_page.dart';

class Routes {
  static Route<dynamic> generatorRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => LayoutBuilder(builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return const LandingPageWeb();
                  } else {
                    return const LandingPageMobile();
                  }
                }),
            settings: settings);
      case '/About':
        final args = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => LayoutBuilder(builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return const AboutWeb();
                  } else {
                    return const AboutMobile();
                  }
                }),
            settings: settings);
      case '/Projects':
        final args = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => LayoutBuilder(builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return const ProjectPageWeb();
                  } else {
                    return const ProjectPageMobile();
                  }
                }),
            settings: settings);
      default:
        return MaterialPageRoute(builder: (_) {
          return const Center(
            child: Text("ERROR PAGE"),
          );
        });
    }
  }
}
