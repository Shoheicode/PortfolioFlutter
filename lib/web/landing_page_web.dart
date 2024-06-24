import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageWeb extends StatefulWidget{
  const LandingPageWeb({super.key});

  @override
  State<StatefulWidget> createState() => _LandingPageWebState();
  
}

class _LandingPageWebState extends State<LandingPageWeb> {
  urlLauncher(String imgPath, String url){
    return IconButton(
      icon: Image.asset(imgPath, width: 35,filterQuality: FilterQuality.high,),
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
                        BlueContainer(text: "Flutter"),
                        SizedBox(width: 10,),
                        BlueContainer(text: "C++"),
                        SizedBox(width: 10,),
                        BlueContainer(text: "Java"),
                        SizedBox(width: 10,),
                        BlueContainer(text: "Robotics"),
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
                    AnimatedCardWeb(imagePath: "firebase.png", text: "Firebase"),
                    AnimatedCardWeb(imagePath: "flutter.png", text: "Flutter", fit: BoxFit.contain, reverese: true,),
                    AnimatedCardWeb(imagePath: "java.png", text: "Java"),
                    AnimatedCardWeb(imagePath: "cpp.png", text: "C++", reverese: true,)
                  ],
                )
              ],
            )
          ),
          //Fourth Container for contact information
          Container(
            height: heightDevice,
            child: Form(
              key:formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SansBold("Contact Me", 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
              
                        children: [
                          TextForm(
                              heading: "First Name", 
                              width: 350, 
                              hintText: "Please enter first name", 
                              maxLine: 1,
                              controller: _firstNameController, 
                              validator: (text){
                                if(text.toString().isEmpty){
                                  return "First Name is required";
                                }
                              },
                            ),
                          SizedBox(height: 15,),
                          TextForm(
                            heading: "Email", 
                            width: 350, 
                            hintText: "Please enter in email", 
                            maxLine: 1, 
                            controller: _emailNameController,
                            validator: (text){
                              if(text.toString().isEmpty){
                                return "Email is required";
                              }
                            },
                          )
                        ],
                      ),
                      Column(
                        children: [
                          TextForm(heading: "Last Name", width: 350, hintText: "Please enter in laster name", controller: _lastNameController,),
                          SizedBox(height: 15,),
                          TextForm(heading: "Phone Number", width: 350, hintText: "Please enter in your phone number", maxLine: 1, controller:  _phoneNameController,)
                        ],
                      )
                    ],
                  ),
                  TextForm(
                    heading: "Message", 
                    width: widthDevice/1.5, 
                    hintText: "Please type your message", 
                    maxLine: 10,
                    controller: _messageNameController,
                    validator: (text){
                      if(text.toString().isEmpty){
                        return "Message is required";
                      }
                    },
                  ),
                  MaterialButton(
                    elevation: 20.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    height: 60.0,
                    minWidth: 200.0,
                    color:Colors.blueAccent,
                    child:SansBold("Submit", 20.0),
                    onPressed: () async{
                      //logger.d(_firstNameController.text);
                      final sendingData = AddDataFireStore();
                      if(formKey.currentState!.validate()){
                        await sendingData.addResponse(
                          _firstNameController.text, 
                          _lastNameController.text, 
                          _emailNameController.text, 
                          _phoneNameController.text, 
                          _messageNameController.text
                          );
                        formKey.currentState!.reset();
                        showDialog(context: context, builder: (BuildContext contexct)=> AlertDialog(
                            title: SansBold("Message Submitted", 30),
                          )
                        );
                      }

                    }
                  )
                ]
              ),
            ),
          ),
          SizedBox(height: 10.0,)
        ]
      ),
    );
  }
}