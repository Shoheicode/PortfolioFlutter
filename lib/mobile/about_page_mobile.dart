import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  State<StatefulWidget> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
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
          const CircleAvatar(
            radius: 70,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("assets/J.png"),
          ),
          const SizedBox(
            height: 15,
          ),
          const SansBold("Jason Irie", 30),
          const SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              urlLauncher("assets/linkedin.png",
                  "https://www.linkedin.com/in/jason-irie-2bb2b0243/"),
              IconButton(
                icon: SvgPicture.asset("assets/github.svg",
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
              TabsMobile(
                "Contact",
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
      ),
      //The Main body of the web application
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: heightDevice / 1.2,
              width: widthDevice / 1.5,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SansBold("About Me", 40.0),
                        const SizedBox(
                          height: 15.0,
                        ),
                        SizedBox(
                            width: widthDevice / 1.2,
                            child: const Sans(
                                "Hello! I'm Jason Irie. I specialize in C++ and making applications using C++. I strive to ensure my projects and my work is the best to its ability and striving to utilize my abilities to help others. I have created many projects that demonstrate my understanding and knowledge in C++ and Data Structures and Algorithims.",
                                15.0)),
                        const SizedBox(height: 10),
                        const Row(
                          children: [
                            BlueContainer(text: "Flutter"),
                            SizedBox(
                              width: 10,
                            ),
                            BlueContainer(text: "C++"),
                            SizedBox(
                              width: 10,
                            ),
                            BlueContainer(text: "Java"),
                            SizedBox(
                              width: 10,
                            ),
                            BlueContainer(text: "Robotics"),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        )
                      ],
                    )
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const AnimatedCard(
                    imagePath: "assets/cpp.png", width: 300, height: 300),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: heightDevice / 3,
                  width: widthDevice / 1.1,
                  child: const Column(children: [
                    SansBold("C++", 40),
                    SizedBox(
                      height: 20,
                    ),
                    Sans(
                        "Do you need help creating an application in C++? I have made many projects using C++",
                        20)
                  ]),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 100.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: heightDevice / 3,
                  width: widthDevice / 1.1,
                  child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SansBold("Flutter and Firebase", 40),
                        SizedBox(
                          height: 10,
                        ),
                        Sans(
                            "Do you need help creating a web application or app? I know my way using Flutter and Firebase and competed in the Google Solution Challenge.",
                            20)
                      ]),
                ),
                const AnimatedCard(
                  imagePath: "assets/flutter.png",
                  width: 300,
                  height: 300,
                  reverese: true,
                ),
                const AnimatedCard(
                    imagePath: "assets/firebase.png", width: 300, height: 300)
              ],
            ),
          ),
          const SizedBox(
            height: 100.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const AnimatedCard(
                  imagePath: "assets/java.png", width: 300, height: 300),
              SizedBox(
                height: heightDevice / 3,
                child: const Column(children: [
                  SansBold("Java", 40),
                  SizedBox(
                    height: 10,
                  ),
                  Sans(
                      "Do you need help creating an application using Java? That's my cup of joe (joke). I have coded many things from Robots to games of Tic-Tac-Toe.",
                      20)
                ]),
              ),
            ],
          ),
          const SizedBox(
            height: 100.0,
          ),
        ],
      ),
    );
  }
}
