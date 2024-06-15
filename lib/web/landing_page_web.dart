import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/components.dart';

class LandingPageWeb extends StatefulWidget{
  const LandingPageWeb({super.key});

  @override
  State<StatefulWidget> createState() => _LandingPageWebState();
  
}

class _LandingPageWebState extends State<LandingPageWeb> {
  @override
  Widget build(BuildContext context) {
    //Gets the height of the device being used
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Scaffold(
      drawer:Drawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        //Getting the Theme and setting how the default settings of webpage.
        iconTheme: IconThemeData(
          size: 25.0,
          color: Colors.black
        ),
        //Sections of the App Bar
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Spacer(flex: 3,),
              TabsWeb("Home"),
              Spacer(),
              TabsWeb("Projects"),
              Spacer(),
              TabsWeb("Blog"),
              Spacer(),
              TabsWeb("About"),
              Spacer(),
              TabsWeb("Contact")
            ]
          ),
      ),
      //The Main body of the web application
      body: ListView(
        children:[
          //First Container with the introduction
          Container(
          height: heightDevice-56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color:Colors.blue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),

                        )
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: SansBold("Hello, I'm", 50),
                  ),
                  SizedBox(height: 15,),
                  SansBold("Jason Irie", 100.0),
                  Sans("Software Developer", 50),
                  SizedBox(height:15.0),
                  Row(
                    children: [
                      Icon(Icons.email),
                      SizedBox(width: 20,),
                      Sans("jsirie10@gmail.com", 15),

                    ],
                  ),
                ],
              ),
              CircleAvatar(
                    //Creates the circle avatar and the outer blue circle
                    radius:187.0,
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                      //Inner black circle
                      radius:183,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        //Image of the avatar
                        radius:180,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("J.png"),
                      ),
                    ),
                  ),
            ],
          ),
        ),
          //Second Container about me
          Container(
            height: heightDevice/1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("web.png", height: heightDevice/2.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold("About me", 40.0),
                    SizedBox(height: 15,),
                    Sans("Hello! I'm Jason irie. I specialize in C++ and making applications using C++.", 15.0),
                    Sans("I strive to ensure my projects and my work is the best to its ability and ", 15),
                    Sans("striving to utilize my abilities to help others. I have created many projects that", 15.0),
                    Sans("demonstrate my understanding and knowledge in C++ and Data Structures and Algorithims", 15.0),
                    SizedBox(height:10),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                              style:BorderStyle.solid,
                              width: 2.0
                            ),
                            borderRadius: BorderRadius.circular(5)
                          ),
                          padding: EdgeInsets.all(10.0),
                          child: Text("Flutter")
                        ),
                        SizedBox(width: 10,),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                              style:BorderStyle.solid,
                              width: 2.0
                            ),
                            borderRadius: BorderRadius.circular(5)
                          ),
                          padding: EdgeInsets.all(10.0),
                          child: Text("C++")
                        ),
                        SizedBox(width: 10,),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                              style:BorderStyle.solid,
                              width: 2.0
                            ),
                            borderRadius: BorderRadius.circular(5)
                          ),
                          padding: EdgeInsets.all(10.0),
                          child: Text("Java")
                        ),
                        SizedBox(width: 10,),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                              style:BorderStyle.solid,
                              width: 2.0
                            ),
                            borderRadius: BorderRadius.circular(5)
                          ),
                          padding: EdgeInsets.all(10.0),
                          child: Text("Robotics")
                        ),
                        SizedBox(width: 10,),
                      ],
                    )
                  ]
                ),
              ],
            ),
          ),
          //Third Container with specialties
          Container(
            height: heightDevice/1.3,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SansBold("What I do?", 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      elevation: 30.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)
                      ),
                      shadowColor: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "java.png", 
                              height: 200,
                              width: 200,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(height: 10,),
                            Sans("Java", 20)
                          ]
                        ),
                      ),
                    ),
                    Card(
                      elevation: 30.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)
                      ),
                      shadowColor: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "cpp.png", 
                              height: 200,
                              width: 200,
                            ),
                            SizedBox(height: 10,),
                            Sans("C++", 20)
                          ]
                        ),
                      ),
                    ),
                    Card(
                      elevation: 30.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)
                      ),
                      shadowColor: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "flutter.png", 
                              height: 200,
                              width: 200,
                            ),
                            SizedBox(height: 10,),
                            Sans("Flutter", 20)
                          ]
                        ),
                      ),
                    ),
                    Card(
                      elevation: 30.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)
                      ),
                      shadowColor: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "firebase.png", 
                              height: 200,
                              width: 200,
                            ),
                            SizedBox(height: 10,),
                            Sans("Firebase", 20)
                          ]
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ),
          //Fourth Container for contact information
          Container(
            height: heightDevice,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SansBold("Contact Me", 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(

                      children: [
                        TextForm(heading: "First Name", width: 350, hintText: "Please enter first name", maxLine: 1,),
                        SizedBox(height: 15,),
                        TextForm(heading: "Email", width: 350, hintText: "Please enter in email", maxLine: 1,)
                      ],
                    ),
                    Column(
                      children: [
                        TextForm(heading: "Last Name", width: 350, hintText: "Please enter in laster name"),
                        SizedBox(height: 15,),
                        TextForm(heading: "Phone Number", width: 350, hintText: "Please enter in your phone number", maxLine: 1,)
                      ],
                    )
                  ],
                ),
                TextForm(
                  heading: "Message", 
                  width: widthDevice/1.5, 
                  hintText: "Please type your message", 
                  maxLine: 10,
                )
              ]
            ),
          ),
        ]
      ),
    );
  }
  
}