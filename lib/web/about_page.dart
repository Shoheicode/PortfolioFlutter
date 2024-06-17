import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutWeb extends StatefulWidget{
  const AboutWeb({super.key});

  @override
  State<StatefulWidget> createState() => _AboutState();
  
}

class _AboutState extends State<AboutWeb> {
  urlLauncher(String imgPath, String url){
    return IconButton(
      icon: Image.asset(imgPath, width: 35,filterQuality: FilterQuality.high,),
      //Async allows for urls launched
      onPressed: () async {
        await launchUrl(Uri.parse(url));
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    //Gets the height of the device being used
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Scaffold(
      drawer:Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("J.png"),
            ),
            SizedBox(height: 15,),
            SansBold("Jason Irie", 30),
            SizedBox(height: 15.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                urlLauncher("linkedin.png", "https://www.linkedin.com/in/jason-irie-2bb2b0243/"),
                IconButton(
                  icon: SvgPicture.asset("github.svg", color: Colors.black, width: 35.0),
                  onPressed: () async {
                    await launchUrl(Uri.parse("https://github.com/Shoheicode"));
                  },
                ),
              ],
            )
          ]
        ),
      ),
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
          //First Container with the introduction
          Container(
          height: heightDevice-56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    child: SansBold("Hello, I'm", 50),
                  ),
                  SizedBox(height: 15,),
                  SansBold("Jason Irie", 100.0),
                  Sans("Software Developer", 50),
                  SizedBox(height:15.0),
                  Row(
                    children: [
                      Icon(Icons.email),
                      SizedBox(width: 20,),
                      Sans("jsirie10@gmail.com", 15),

                    ],
                  ),
                ],
              ),
              CircleAvatar(
                    //Creates the circle avatar and the outer blue circle
                    radius:187.0,
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                      //Inner black circle
                      radius:183,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        //Image of the avatar
                        radius:180,
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