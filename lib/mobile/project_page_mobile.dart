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
                              "ICEMAN is a C++ arcade-style video game where players dig through an underground oil field, collect hidden items, avoid falling boulders, and outsmart enemy protesters. Built with object-oriented programming, inheritance, STL data structures, and pathfinding algorithms, the project combines classic gameplay mechanics with AI movement, collision detection, and real-time game logic.",
                              20.0,
                              TextAlign.center),
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
                  const SizedBox(
                    height: 100.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const AnimatedCard(
                          imagePath: "assets/projects/astarfitness.png",
                          width: 500,
                          height: 500),
                      SizedBox(
                        height: 100.0,
                      ),
                      Column(
                        children: [
                          const SansBold(
                            "AStar Fitness Project",
                            40.0,
                            align: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          const Sans(
                              "AStar Fitness is an intelligent fitness application designed to revolutionize how users achieve their health and fitness goals. Whether you're a beginner or an advanced athlete, AStar Fitness adapts to your needs, crafting exercise programs that evolve as you do.",
                              30.0,
                              TextAlign.center),
                          const SizedBox(height: 15.0),
                          Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // Centers content vertically
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: SvgPicture.asset("assets/github.svg",
                                      color: Colors.black, width: 35.0),
                                  onPressed: () async {
                                    await launchUrl(Uri.parse(
                                        "https://github.com/Shoheicode/fitness-app-project"));
                                  },
                                ),
                                IconButton(
                                  icon: Image.asset("assets/web.png",
                                      color: Colors.black, width: 35.0),
                                  onPressed: () async {
                                    await launchUrl(Uri.parse(
                                        "https://fitness-app-project-theta.vercel.app/"));
                                  },
                                ),
                              ])
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const AnimatedCard(
                          imagePath: "assets/projects/flashcards.png",
                          width: 500,
                          height: 500),
                      SizedBox(
                        height: 100,
                      ),
                      Column(
                        children: [
                          const SansBold(
                            "AStar Flashcards",
                            40.0,
                            align: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          const Sans(
                              'An innovative web application that’s set to transform how students study. This robust application uses cutting-edge technologies like Next.js, React, ',
                              30.0,
                              TextAlign.center),
                          const Sans(
                              'Firebase, and Stripe.', 30.0, TextAlign.center),
                          const SizedBox(height: 15.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment
                                .center, // Centers content vertically
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: SvgPicture.asset("assets/github.svg",
                                    color: Colors.black, width: 35.0),
                                onPressed: () async {
                                  await launchUrl(Uri.parse(
                                      "https://github.com/Shoheicode/Project-4-AI-Flashcards"));
                                },
                              ),
                              IconButton(
                                icon: Image.asset("assets/web.png",
                                    color: Colors.black, width: 35.0),
                                onPressed: () async {
                                  await launchUrl(Uri.parse(
                                      "https://project-4-ai-flashcards.vercel.app/"));
                                },
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
