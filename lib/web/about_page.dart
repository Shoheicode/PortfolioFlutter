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
      extendBodyBehindAppBar: true,
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
      children: [
        SizedBox(
          height: 500.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SansBold("About Me", 40.0),
                  SizedBox(height: 15.0,),
                  Sans("Hello! I'm Jason irie. I specialize in C++ and making applications using C++.", 15.0),
                  Sans("I strive to ensure my projects and my work is the best to its ability and ", 15),
                  Sans("striving to utilize my abilities to help others. I have created many projects that", 15.0),
                  Sans("demonstrate my understanding and knowledge in C++ and Data Structures and Algorithims", 15.0),
                  SizedBox(height:10),
                  Row(
                    children: [
                      BlueContainer(text: "Flutter"),
                      SizedBox(width: 10,),
                      BlueContainer(text: "C++"),
                      SizedBox(width: 10,),
                      BlueContainer(text: "Java"),
                      SizedBox(width: 10,),
                      BlueContainer(text: "Robotics"),
                      SizedBox(width: 10,),
                    ],
                    )
                ],
              )
            ]
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedCard(imagePath: "cpp.png", width: 300, height: 300),
            SizedBox(
              height: heightDevice/3,
              child: Column(
                children: [
                  SansBold("C++",  40),
                  SizedBox(height: 10,),
                  Sans("Do you need help creating an application in C++? I can help you work on it.", 20)
                ]
              ),
            )
            
          ],
        ),
        SizedBox(height: 100.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: heightDevice/3,
              width: widthDevice/2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SansBold("Flutter and Firebase",  40),
                  SizedBox(height: 10,),
                  Sans("Do you need help creating a web application or app? I know my way using Flutter and Firebase.", 20)
                ]
              ),
            ),
            AnimatedCard(imagePath: "flutter.png", width: 300, height: 300, reverese: true,),
            AnimatedCard(imagePath: "firebase.png", width: 300 , height: 300)

            
          ],
        ),
        SizedBox(height: 100.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedCard(imagePath: "java.png", width: 300, height: 300),
            SizedBox(
              height: heightDevice/3,
              child: Column(
                children: [
                  SansBold("JAVA",  40),
                  SizedBox(height: 10,),
                  Sans("Do you need help creating an application using Java? That's my cup of joe.", 20)
                ]
              ),
            ),
            
          ],
        ),
        SizedBox(height: 100.0,),

      ],
      ),
    );
  }
  
}