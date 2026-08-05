import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<StatefulWidget> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
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
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const CircleAvatar(
            radius: 70,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("assets/icons/J.png"),
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
          )
        ]),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        //Getting the Theme and setting how the default settings of webpage.
        iconTheme: const IconThemeData(size: 25.0, color: Colors.black),
        //Sections of the App Bar
        title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Spacer(
                flex: 3,
              ),
              TabsWeb("Home"),
              Spacer(),
              TabsWeb("Projects"),
              // Spacer(),
              // TabsWeb("Blog"),
              Spacer(),
              TabsWeb("About"),
              Spacer(),
            ]),
      ),
      //The Main body of the web application
      body: ListView(children: [
        //First Container with the introduction
        SizedBox(
          height: heightDevice - 56.0,
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
                    child: const SansBold("Hello, I'm", 50.0),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SansBold("Jason Irie", 100.0),
                  const Sans("Software Developer", 50.0, TextAlign.center),
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
                ],
              ),
              const CircleAvatar(
                //Creates the circle avatar and the outer blue circle
                radius: 187.0,
                backgroundColor: Colors.blue,
                child: CircleAvatar(
                  //Inner black circle
                  radius: 183,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    //Image of the avatar
                    radius: 180,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/icons/J.png"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
