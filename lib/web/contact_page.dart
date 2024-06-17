import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWeb extends StatefulWidget{
  const ContactWeb({super.key});

  @override
  State<StatefulWidget> createState() => _ContactState();
  
}

class _ContactState extends State<ContactWeb> {
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
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      //   //Getting the Theme and setting how the default settings of webpage.
      //   iconTheme: IconThemeData(
      //     size: 25.0,
      //     color: Colors.black
      //   ),
      //   //Sections of the App Bar
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         Spacer(flex: 3,),
      //         TabsWeb("Home"),
      //         Spacer(),
      //         TabsWeb("Projects"),
      //         Spacer(),
      //         TabsWeb("Blog"),
      //         Spacer(),
      //         TabsWeb("About"),
      //         Spacer(),
      //         TabsWeb("Contact")
      //       ]
      //     ),
      // ),
      //The Main body of the web application
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(
                size: 25.0,
                color: Colors.black,
              ),
            )
          ];
        },
        body: SingleChildScrollView(),
      ),
    );
  }
  
}