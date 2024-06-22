
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogPage extends StatefulWidget{

  const BlogPage({super.key});


  @override
  State<StatefulWidget> createState() =>_BlogPage();

}

class _BlogPage extends State<BlogPage>{
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
      //The Main body of the web application
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return <Widget>[
            SliverAppBar(
              expandedHeight: 800.0,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(
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
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: AbelText(
                    text: "Welcome to my blog", 
                    size: 60.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ), 
                  
                ),
                
                background: Image.asset("blog.jpg", filterQuality: FilterQuality.high, fit: BoxFit.cover,),
                
              ),
              title: Row(
                children: [
                  Spacer(flex: 3,),
                  TabsWeb("Home", color: Colors.white,),
                  Spacer(),
                  TabsWeb("Projects", color: Colors.white,),
                  Spacer(),
                  TabsWeb("Blog", color: Colors.white,),
                  Spacer(),
                  TabsWeb("About", color: Colors.white,),
                  Spacer(),
                  TabsWeb("Contact", color: Colors.white,)
                ],
              ),
            )
          ];
        },
        body: ListView(
          children: [
            BlogPost(),
          ],
        )
      ),
    );
  }
}

class BlogPost extends StatefulWidget{

  const BlogPost({super.key});
  
  @override
  State<StatefulWidget> createState() => _BlogPostState();

}

class _BlogPostState extends State<BlogPost>{
  bool expand = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 70.0, right: 70.0, top: 80.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(
            style: BorderStyle.solid,
            width: 1.0,
            color: Colors.black
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(3.0)
                  ),
                  child: AbelText(
                    text: "Who is Dash?",
                    size: 25.0,
                    color: Colors.white
                  )
                ),
                IconButton(
                    icon: Icon(Icons.arrow_drop_down_circle_outlined),
                    onPressed: (){
                      //Need the set state to change/update the state of the widget like boolens and stuff like that. 
                      setState((){
                        expand = !expand;
                        print(expand);
                      });
                    },
                    color: Colors.black,
                ),
              ],
            ),
            SizedBox(height: 7.0,),
            Text("As soon as Shams Zakhour started working as a Dart writer at Google in December 2013, she started advocating for a Dart mascot. After documenting Java for 14 years, she had observed how beloved the Java mascot, Duke, had become, and she wanted something similar for Dart. But the idea didn't gain momentum until 2017, when one of the Flutter engineers, Nina Chen, suggested it on an internal mailing list. The Flutter VP at the time, Joshy Joseph, approved the idea and asked the organizer for the 2018 Dart Conference, Linda Rasmussen, to make it happen. Once Shams heard about these plans, she rushed to Linda and asked to own and drive the project to produce the plushies for the conference. Linda had already elicited some design sketches, which she handed off. Starting with the sketches, Shams located a vendor who could work within an aggressive deadline (competing with Lunar New Year), and started the process of creating the specs for the plushy. That's right, Dash was originally a Dart mascot, not a Flutter mascot.",
              style: GoogleFonts.openSans(fontSize: 20.0,),
              maxLines: expand == true ? null : 3,
              overflow: expand == true ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
          ]
        ),
      ),
    );
  }
  
}