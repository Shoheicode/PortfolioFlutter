import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectPageWeb extends StatefulWidget{
  const ProjectPageWeb({super.key});

  @override
  State<StatefulWidget> createState() => _ProjectPageWebState();
  
}

class _ProjectPageWebState extends State<ProjectPageWeb> {
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
            const CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/J.png"),
            ),
            const SizedBox(height: 15,),
            const SansBold("Jason Irie", 30),
            const SizedBox(height: 15.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                urlLauncher("linkedin.png", "https://www.linkedin.com/in/jason-irie-2bb2b0243/"),
                IconButton(
                  icon: SvgPicture.asset("assets/github.svg", color: Colors.black, width: 35.0),
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
      //The Main body of the web application
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
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
                    color:Colors.black,
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
                
                background: Image.asset("assets/project.png", filterQuality: FilterQuality.high, fit: BoxFit.cover,),
                
              ),
              title: const Row(
                children: [
                  Spacer(flex: 3,),
                  TabsWeb("Home", color: Colors.black,),
                  Spacer(),
                  TabsWeb("Projects", color: Colors.black,),
                  Spacer(),
                  TabsWeb("Blog", color: Colors.black,),
                  Spacer(),
                  TabsWeb("About", color: Colors.black,),
                  Spacer(),
                  TabsWeb("Contact", color: Colors.black,)
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
                    const AnimatedCard(imagePath: "assets/Iceman.png", width: 500, height: 500),
                    Column(
                      children: [
                        const SansBold("IceMan Project", 40.0),
                        const SizedBox(height: 15.0,),
                        const Sans("This project focuses on the using C++ to create a game", 30.0),
                        const SizedBox(height:15.0),
                        IconButton(
                          icon: SvgPicture.asset("assets/github.svg", color: Colors.black, width: 35.0),
                          onPressed: () async {
                            await launchUrl(Uri.parse("https://github.com/Shoheicode/CS30-ICEMAN"));
                          },
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 100.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const SansBold("TransferWise Project", 40.0),
                        const SizedBox(height: 15.0,),
                        const Sans("This project focused on assisting", 30.0),
                        const Sans("students in the transfer process", 30.0),
                        const Sans("and helping them find courses at colleges", 30.0),
                        const Sans("near them that can help", 30.0),
                        const Sans("them transfer. It used Flutter,", 30.0),
                        const Sans("Firebase, and Google API's", 30.0), 
                        const Sans("and was submitted", 30.0),
                        const Sans("in the 2023 Google Solution Challenge.", 30.0),
                        const SizedBox(height:15.0),
                        IconButton(
                          icon: SvgPicture.asset("assets/github.svg", color: Colors.black, width: 35.0),
                          onPressed: () async {
                            await launchUrl(Uri.parse("https://github.com/El-Camino-Google-Developer-Student-Club/El-Camino-2023-Solution-Challenge"));
                          },
                        ),
                      ],
                    ),
                    const AnimatedCard(imagePath: "assets/ImageofWebApplication.png", width: 500, height: 500),
                  ],
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}