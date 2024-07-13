import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
            const CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/J.png"),
            ),
            const SizedBox(height: 15,),
            const SansBold("Jason Irie", 30.0),
            const SizedBox(height: 15.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                urlLauncher("assets/linkedin.png", "https://www.linkedin.com/in/jason-irie-2bb2b0243/"),
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        //Getting the Theme and setting how the default settings of webpage.
        iconTheme: const IconThemeData(
          size: 25.0,
          color: Colors.black
        ),
        //Sections of the App Bar
        title: const Row(
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
          SizedBox(
          height: heightDevice-56.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color:Colors.blue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),

                        )
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: const SansBold("Hello, I'm", 50.0),
                  ),
                  const SizedBox(height: 15,),
                  const SansBold("Jason Irie", 100.0),
                  const Sans("Software Developer", 50.0),
                  const SizedBox(height:15.0),
                  const Row(
                    children: [
                      Icon(Icons.email),
                      SizedBox(width: 20,),
                      Sans("jsirie10@gmail.com", 15.0),

                    ],
                  ),
                ],
              ),
              const CircleAvatar(
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
                        backgroundImage: AssetImage("assets/J.png"),
                      ),
                    ),
                  ),
            ],
          ),
        ),
          //Second Container about me
          SizedBox(
            height: heightDevice/1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/web.png", height: heightDevice/2.0),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold("About me", 40.0),
                    SizedBox(height: 15,),
                    Sans("Hello! I'm Jason irie. I specialize in C++ and making applications using C++.", 15.0),
                    Sans("I strive to ensure my projects and my work is the best to its ability and ", 15.0),
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
          SizedBox(
            height: heightDevice/1.3,
            child:const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SansBold("What I do?", 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedCardWeb(imagePath: "assets/firebase.png", text: "Firebase"),
                    AnimatedCardWeb(imagePath: "assets/flutter.png", text: "Flutter", fit: BoxFit.contain, reverese: true,),
                    AnimatedCardWeb(imagePath: "assets/java.png", text: "Java"),
                    AnimatedCardWeb(imagePath: "assets/cpp.png", text: "C++", reverese: true,)
                  ],
                )
              ],
            )
          ),
          //Fourth Container for contact information
          SizedBox(
            height: heightDevice,
            child: Form(
              key:formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SansBold("Contact Me", 40.0),
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
                          const SizedBox(height: 15,),
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
                          const SizedBox(height: 15,),
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
                    child:const SansBold("Submit", 20.0),
                    onPressed: () async{
                      //logger.d(_firstNameController.text);
                      final sendingData = AddDataFireStore();
                      if(formKey.currentState!.validate()){
                        if (await sendingData.addResponse(
                          _firstNameController.text, 
                          _lastNameController.text, 
                          _emailNameController.text, 
                          _phoneNameController.text, 
                          _messageNameController.text
                          )){
                            formKey.currentState!.reset();
                            DialogError(context, "Message sent");
                          }
                          else{
                            DialogError(context, "Message was not sent");
                          }
                      }

                    }
                  )
                ]
              ),
            ),
          ),
          const SizedBox(height: 10.0,)
        ]
      ),
    );
  }
}