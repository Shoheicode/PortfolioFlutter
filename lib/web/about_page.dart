import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutWeb extends StatefulWidget {
  const AboutWeb({super.key});

  @override
  State<StatefulWidget> createState() => _AboutState();
}

class _AboutState extends State<AboutWeb> {
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
      body: ListView(
        children: [
          const SizedBox(
            height: 500.0,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/about/me_photo.jpg"),
                  ),
                  SizedBox(width: 35),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SansBold("About Me", 40.0),
                      SizedBox(
                        height: 15.0,
                      ),
                      SizedBox(
                          width: 700,
                          child: Sans(
                            "I am a software engineer focused on building automation tools, API integrations, full-stack applications, and robotics systems. I have experience with Python, FastAPI, React, Next.js, C++, JavaScript, OpenAI APIs, Flutter, MATLAB, and embedded platforms including ESP32 and NVIDIA Jetson Orin.",
                            15.0,
                            TextAlign.start,
                          )),
                      SizedBox(
                          width: 700,
                          child: Sans(
                            "My work includes automating e-commerce workflows, developing REST API services, processing large datasets, building AI-assisted tools, and contributing to robotics research involving simulation, LiDAR perception, reinforcement learning, and autonomous navigation. I enjoy solving practical problems through software and building tools that make complex workflows faster, more reliable, and easier to use.",
                            15.0,
                            TextAlign.start,
                          )),
                      SizedBox(height: 10),
                      Row(
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
                          BlueContainer(text: "React"),
                          SizedBox(
                            width: 10,
                          ),
                          BlueContainer(text: "Python"),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      )
                    ],
                  )
                ]),
          ),
          const SizedBox(
            height: 500.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SansBold("Degrees & Coursework", 40.0),
                SizedBox(height: 20.0),
                SizedBox(
                  width: 800,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 70,
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage("assets/about/ucla.png"),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SansBold("University of California, Los Angeles",
                                  22.0),
                              SizedBox(height: 5),
                              Sans(
                                "Bachelors of Science in Mathematics of Computation",
                                16.0,
                                TextAlign.start,
                              ),
                              SizedBox(height: 8),
                              SizedBox(
                                child: Sans(
                                  "Relevant Coursework: Algorithms & Complexity, Data Management Systems, Computer Graphics, Linear Algebra, Probability, Statistics, Applied Numerical Methods, Mathematical Modeling, Differential Equations, Game Theory",
                                  15.0,
                                  TextAlign.start,
                                ),
                                width: 700,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 25),
                      Row(children: [
                        const CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage("assets/about/elcamino.png"),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SansBold("El Camino Community College", 22.0),
                            SizedBox(height: 5),
                            Sans(
                              "Associates of Science in Mathematics for Transfer; Associates of Science in Physics for Transfer; Certificate of Achievement in Computer Science",
                              16.0,
                              TextAlign.start,
                            ),
                            SizedBox(height: 8),
                            SizedBox(
                              child: Sans(
                                "Relevant Coursework: Data Structures, Java Programming, C++ Programming, Advanced C++, Assembly Language Programming, Foundations of Data Science, Discrete Structures, Differential Equations & Linear Algebra, Circuit Analysis",
                                15.0,
                                TextAlign.start,
                              ),
                              width: 700,
                            ),
                          ],
                        )
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 500.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SansBold("Awards/Honors", 40.0),
                  SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                    width: 700,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        BulletPoint(
                            text:
                                'Academic Achievement in Computer Science Award — Recognized for outstanding academic achievement in computer science coursework.'),
                        BulletPoint(
                            text:
                                'Forrest G. Murdock Leadership Award — Awarded for leadership, service, responsibility, communication, initiative, and collaboration.'),
                        BulletPoint(
                            text:
                                'Wayne and Margaret Bemis Scholarship for Sciences — Awarded for strong academic performance and interest in pursuing science-related fields.'),
                        BulletPoint(
                            text:
                                'Overall Best Robot Prototype Award — Recognized for developing a robotics prototype using OpenCV, Python, machine learning, and hardware/software integration.'),
                      ],
                    ),
                  )
                ]),
          )
        ],
      ),
    );
  }
}
