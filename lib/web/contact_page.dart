import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWeb extends StatefulWidget{
  const ContactWeb({super.key});

  @override
  State<StatefulWidget> createState() => _ContactState();
  
}

class _ContactState extends State<ContactWeb> {
  urlLauncher(String imgPath, String url){
    return IconButton(
      icon: Image.asset(imgPath, width: 35,filterQuality: FilterQuality.high,),
      //Async allows for urls launched
      onPressed: () async {
        await launchUrl(Uri.parse(url));
      },
    );
  }
  
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
                background: Image.asset(
                  "assets/phone.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              title: Row(
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
                ],
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height:30.0),
              SansBold("Contact Me", 30.0),
              SizedBox(height:30.0),
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
                ),
                SizedBox(height: 30,),
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
                        if(await sendingData.addResponse(
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
                            DialogError(context, "Message not set");
                          }
                      }

                    }
                )
            ],
          ),
        ),
      ),
    );
  }
  
}