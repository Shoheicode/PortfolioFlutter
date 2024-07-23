import 'package:flutter/material.dart';
import 'package:portfolio/mobile/about_page_mobile.dart';
import 'package:portfolio/mobile/contact_page_mobile.dart';
import 'package:portfolio/mobile/landing_page_mobile.dart';
import 'package:portfolio/mobile/project_page_mobile.dart';
import 'package:portfolio/web/about_page.dart';
import 'package:portfolio/web/contact_page.dart';
import 'package:portfolio/web/landing_page_web.dart';
import 'package:portfolio/web/project_page.dart';

class Routes{
  static Route<dynamic> generatorRoute(RouteSettings settings){
    switch(settings.name){
      case '/':
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(builder: (context, constraints){
            if(constraints.maxWidth > 800){
              return LandingPageWeb();
            }
            else{
              return LandingPageMobile();
            }
          }), 
          settings: settings);
      case '/About':
        final args = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(builder: (context, constraints){
            if(constraints.maxWidth > 800){
              return AboutWeb();
            }
            else{
              return AboutMobile();
            }
          }), 
          settings: settings);
      case '/Projects':
        final args = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(builder: (context, constraints){
            if(constraints.maxWidth > 800){
              return ProjectPageWeb();
            }
            else{
              return ProjectPageMobile();
            }
          }), 
          settings: settings);
      case '/Contact':
        final args = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(builder: (context, constraints){
            if(constraints.maxWidth > 800){
              return ContactWeb();
            }
            else{
              return ContactMobile();
            }
          }), 
          settings: settings);
      default:
        return MaterialPageRoute(builder: (_){
          return Center(
            child: Text("ERROR PAGE"),
          );
        });
    }
    
  }
}