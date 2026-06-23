import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectPageWeb extends StatefulWidget {
  const ProjectPageWeb({super.key});

  @override
  State<StatefulWidget> createState() => _ProjectPageWebState();
}

class _ProjectPageWebState extends State<ProjectPageWeb> {
  static const description =
      'An innovative web application that’s set to transform '
      'how students and professionals create, organize, and '
      'review flashcards. This robust application uses '
      'cutting-edge technologies like Next.js, React, '
      'Firebase, and Stripe. Alongside my partner, we have '
      'built a dynamic and scalable flashcard platform that'
      'delivers substantial value to users aiming to boost '
      'their learning efficiency. ';

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
            const SansBold("Jason Irie", 30),
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
                    "assets/projects/project.png",
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                ),
                title: const Row(
                  children: [
                    Spacer(
                      flex: 3,
                    ),
                    TabsWeb(
                      "Home",
                      color: Colors.black,
                    ),
                    Spacer(),
                    TabsWeb(
                      "Projects",
                      color: Colors.black,
                    ),
                    //Spacer(),
                    //TabsWeb("Blog", color: Colors.black,),
                    Spacer(),
                    TabsWeb(
                      "About",
                      color: Colors.black,
                    ),
                    Spacer(),
                  ],
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const AnimatedCard(
                          imagePath: "assets/projects/Iceman.png",
                          width: 500,
                          height: 500),
                      Column(
                        children: [
                          const SansBold("IceMan Project", 40.0),
                          const SizedBox(
                            height: 15.0,
                          ),
                          const SizedBox(
                            width: 700,
                            child: Sans(
                                "ICEMAN is a C++ arcade-style video game where players dig through an underground oil field, collect hidden items, avoid falling boulders, and outsmart enemy protesters. Built with object-oriented programming, inheritance, STL data structures, and pathfinding algorithms, the project combines classic gameplay mechanics with AI movement, collision detection, and real-time game logic.",
                                20.0,
                                TextAlign.center),
                          ),
                          const SizedBox(height: 15.0),
                          IconButton(
                            icon: SvgPicture.asset("assets/icons/github.svg",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const SansBold("AStar Fitness Project", 40.0),
                          const SizedBox(
                            height: 15.0,
                          ),
                          const SizedBox(
                            width: 700,
                            child: Sans(
                                "AStar Fitness is an AI-powered fitness application that generates personalized workout routines based on a user’s goals, fitness level, and preferences. This project showcases my experience with full-stack web development, including building a responsive frontend with Next.js, React, and TypeScript, integrating Firebase for backend services and user data storage, and using OpenAI to power intelligent workout recommendations. Through this project, I strengthened my skills in API integration, real-time data management, AI-driven personalization, and collaborative software development.",
                                20.0,
                                TextAlign.center),
                          ),
                          const SizedBox(height: 15.0),
                          Row(children: [
                            IconButton(
                              icon: SvgPicture.asset("assets/icons/github.svg",
                                  color: Colors.black, width: 35.0),
                              onPressed: () async {
                                await launchUrl(Uri.parse(
                                    "https://github.com/Shoheicode/fitness-app-project"));
                              },
                            ),
                            IconButton(
                              icon: Image.asset("assets/icons/web.png",
                                  color: Colors.black, width: 35.0),
                              onPressed: () async {
                                await launchUrl(Uri.parse(
                                    "https://fitness-app-project-theta.vercel.app/"));
                              },
                            ),
                          ])
                        ],
                      ),
                      const AnimatedCard(
                          imagePath: "assets/projects/astarfitness.png",
                          width: 500,
                          height: 500),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const AnimatedCard(
                          imagePath: "assets/projects/flashcards.png",
                          width: 500,
                          height: 500),
                      Column(
                        children: [
                          const SansBold("AStar Flashcards", 40.0),
                          const SizedBox(
                            height: 15.0,
                          ),
                          const SizedBox(
                            width: 700,
                            child: Sans(
                                "AStar Flashcards is a full-stack AI-powered flashcard application that allows users to generate, save, and manage study flashcards from custom prompts. Built with Next.js, React, JavaScript, Firebase Firestore, Clerk Authentication, Stripe, and the OpenAI API, the project showcases my experience with full-stack web development, AI integration, user authentication, database management, subscription/payment handling, and building interactive, user-focused web applications.",
                                20.0,
                                TextAlign.center),
                          ),
                          const SizedBox(height: 15.0),
                          Row(
                            children: [
                              IconButton(
                                icon: SvgPicture.asset(
                                    "assets/icons/github.svg",
                                    color: Colors.black,
                                    width: 35.0),
                                onPressed: () async {
                                  await launchUrl(Uri.parse(
                                      "https://github.com/Shoheicode/Project-4-AI-Flashcards"));
                                },
                              ),
                              IconButton(
                                icon: Image.asset("assets/icons/web.png",
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
              ),
            ],
          ),
        ));
  }
}
