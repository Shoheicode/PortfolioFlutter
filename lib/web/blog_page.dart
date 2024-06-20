
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      expanded = !expanded;
                    },
                    color: Colors.black,
                ),
              ],
            )
          ]
        ),
      ),
    );
  }
  
}