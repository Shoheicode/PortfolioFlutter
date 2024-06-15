import 'package:flutter/material.dart';
import 'package:portfolio/components.dart';

class LandingPageWeb extends StatefulWidget{
  const LandingPageWeb({super.key});

  @override
  State<StatefulWidget> createState() => _LandingPageWebState();
  
}

class _LandingPageWebState extends State<LandingPageWeb> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = false;
    // TODO: implement build
    return Scaffold(
      drawer:Drawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          size: 25.0,
          color: Colors.black
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Spacer(flex: 3,),
              TabsWeb("Home"),
              Spacer(),
              TabsWeb("Projects"),
              Spacer(),
              TabsWeb("Blog"),
              Spacer(),
              TabsWeb("About"),
              Spacer(),
              TabsWeb("Contact")
            ]
          ),
      ),
      body: CircleAvatar(
        radius:147.0,
        backgroundColor: Colors.blue,
        child: CircleAvatar(
          radius:143,
          backgroundColor: Colors.black,
          child: CircleAvatar(
            radius:140,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("J.png"),
          ),
        ),
      ),
    );
  }
  
}