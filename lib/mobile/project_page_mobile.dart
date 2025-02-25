import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectPageMobile extends StatefulWidget {
  const ProjectPageMobile({super.key});

  @override
  State<StatefulWidget> createState() => _ProjectPageMobileState();
}

class _ProjectPageMobileState extends State<ProjectPageMobile> {
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
            DrawerHeader(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2.0, color: Colors.black),
                ),
                child: Image.asset("assets/J.png"),
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
        //The Main body of the web application
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 800.0,
                backgroundColor: Colors.white,
                iconTheme: const IconThemeData(
                  size: 25.0,
                  color: Colors.black,
                ),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: const AbelText(
                      text: "Projects",
                      size: 60.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  background: Image.asset(
                    "assets/project.png",
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ];
          },
          body: ListView(
            children: [
              Column(
                children: [
                  const SizedBox(height: 30.0),
                  const SansBold("Works", 40.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AnimatedCard(
                          imagePath: "assets/Iceman.png",
                          width: widthDevice,
                          height: widthDevice),
                      const SizedBox(
                        height: 100.0,
                      ),
                      Column(
                        children: [
                          const SansBold("IceMan Project", 40.0),
                          const SizedBox(
                            height: 15.0,
                          ),
                          const Sans(
                              "This project focuses on the using C++ to create a game",
                              30.0),
                          const SizedBox(height: 15.0),
                          IconButton(
                            icon: SvgPicture.asset("assets/github.svg",
                                color: Colors.black, width: 35.0),
                            onPressed: () async {
                              await launchUrl(Uri.parse(
                                  "https://github.com/Shoheicode/CS30-ICEMAN"));
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 100.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const AnimatedCard(
                          imagePath: "assets/ImageofWebApplication.png",
                          width: 500,
                          height: 500),
                      const SizedBox(
                        height: 100.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SansBold("TransferWise Project", 40.0),
                          const SizedBox(
                            height: 15.0,
                          ),
                          const Sans("This project focused on assisting", 30.0),
                          const Sans("students in the transfer process", 30.0),
                          const Sans(
                              "and helping them find courses at colleges",
                              30.0),
                          const Sans("near them that can help", 30.0),
                          const Sans("them transfer. It used Flutter,", 30.0),
                          const Sans("Firebase, and Google API's", 30.0),
                          const Sans("and was submitted", 30.0),
                          const Sans(
                              "in the 2023 Google Solution Challenge.", 30.0),
                          const SizedBox(height: 15.0),
                          IconButton(
                            icon: SvgPicture.asset("assets/github.svg",
                                color: Colors.black, width: 35.0),
                            onPressed: () async {
                              await launchUrl(Uri.parse(
                                  "https://github.com/El-Camino-Google-Developer-Student-Club/El-Camino-2023-Solution-Challenge"));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
