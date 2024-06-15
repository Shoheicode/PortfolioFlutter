import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/components.dart';

class LandingPageWeb extends StatefulWidget{
  const LandingPageWeb({super.key});

  @override
  State<StatefulWidget> createState() => _LandingPageWebState();
  
}

class _LandingPageWebState extends State<LandingPageWeb> {
  @override
  Widget build(BuildContext context) {
    //Gets the height of the device being used
    var heightDevice = MediaQuery.of(context).size.height;


    // TODO: implement build
    return Scaffold(
      drawer:Drawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        //Getting the Theme and setting how the default settings of webpage.
        iconTheme: IconThemeData(
          size: 25.0,
          color: Colors.black
        ),
        //Sections of the App Bar
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
      //The Main body of the web application
      body: ListView(
        children:[
          Container(
          height: heightDevice-56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color:Colors.blue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),

                        )
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text("Hello, I'm", 
                      style: GoogleFonts.openSans(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                    //Creates the circle avatar and the outer blue circle
                    radius:147.0,
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                      //Inner black circle
                      radius:143,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        //Image of the avatar
                        radius:140,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("J.png"),
                      ),
                    ),
                  ),
            ],
          ),
        ),
        ]
      ),
    );
  }
  
}