import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<StatefulWidget> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
  urlLauncher(String imgPath, String url) {
    return IconButton(
      icon: Image.asset(
        imgPath,
        width: 35,
        filterQuality: FilterQuality.high,
      ),
      //Async allows for urls launched
      onPressed: () async {
        await launchUrl(Uri.parse(url));
      },
    );
  }

  var logger = Logger();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailNameController = TextEditingController();
  final TextEditingController _phoneNameController = TextEditingController();
  final TextEditingController _messageNameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //Gets the height of the device being used
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Scaffold(
      extendBodyBehindAppBar: true,
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          DrawerHeader(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2.0, color: Colors.black),
              ),
              child: Image.asset("assets/icons/J.png"),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const SansBold("Jason Irie", 30.0),
          const SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              urlLauncher("assets/icons/linkedin.png",
                  "https://www.linkedin.com/in/jason-irie-2bb2b0243/"),
              IconButton(
                icon: SvgPicture.asset("assets/icons/github.svg",
                    color: Colors.black, width: 35.0),
                onPressed: () async {
                  await launchUrl(Uri.parse("https://github.com/Shoheicode"));
                },
              ),
            ],
          ),
          const Column(
            children: [
              TabsMobile(
                "Home",
              ),
              SizedBox(
                height: 15,
              ),
              TabsMobile(
                "About",
              ),
              SizedBox(
                height: 15,
              ),
              TabsMobile(
                "Projects",
              ),
              SizedBox(
                height: 15,
              ),
            ],
          )
        ]),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        //Getting the Theme and setting how the default settings of webpage.
        iconTheme: const IconThemeData(size: 25.0, color: Colors.black),
      ),
      //The Main body of the web application
      body: ListView(children: [
        //First Container with the introduction
        SizedBox(
          height: heightDevice / 1.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        )),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: SansBold("Hello, I'm", widthDevice / 11),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SansBold("Jason Irie", widthDevice / 18),
                  Sans(
                      "Software Developer", widthDevice / 11, TextAlign.center),
                  const SizedBox(height: 15.0),
                  const Row(
                    children: [
                      Icon(Icons.email),
                      SizedBox(
                        width: 20,
                      ),
                      Sans("jsirie10@gmail.com", 15.0, TextAlign.center),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  const ResumeButton(),
                  const SizedBox(
                    height: 15,
                  ),
                  const CircleAvatar(
                    //Creates the circle avatar and the outer blue circle
                    radius: 97.0,
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                      //Inner black circle
                      radius: 93,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        //Image of the avatar
                        radius: 90,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("assets/icons/J.png"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        //Second Container about me
      ]),
    );
  }
}
