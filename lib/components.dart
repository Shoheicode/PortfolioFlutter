import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

class TabsWeb extends StatefulWidget{
  final title;
  final color;
  const TabsWeb(this.title, {super.key, this.color});

  @override
  State<StatefulWidget> createState() =>_TabsWebState();

}

class _TabsWebState extends State<TabsWeb>{
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialButton(
      onPressed: (){
        print("HELLO");
        if(widget.title == "Home"){
          Navigator.of(context).pushNamed('/');
        }
        else{
          Navigator.of(context).pushNamed('/' + widget.title);
        }
      },
      child: MouseRegion(
        onEnter: (e){
          setState(() {
            isSelected = true;
          });
        },
        onExit: (e){
          setState(() {
            isSelected = false;
          });
        },
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 100),
          curve: Curves.fastEaseInToSlowEaseOut,
          style: isSelected ? GoogleFonts.oswald(
            shadows: [
              Shadow(color: widget.color ?? Colors.black, offset: const Offset(0, -10,), )],
              color:Colors.transparent,
              fontSize: 25.0,
              decoration: TextDecoration.underline,
              decorationThickness: 1,
              decorationColor: Colors.blue,
            ) : 
            GoogleFonts.oswald(
              color:widget.color ?? Colors.black,
              fontSize: 23.0
            ),
          child: Text(widget.title),
        ),
      ),
    );
  }
  
}

class TabsMobile extends StatefulWidget{
  final title;
  final color;
  const TabsMobile(this.title, {super.key, this.color});

  @override
  State<StatefulWidget> createState() =>_TabsMobileState();

}

class _TabsMobileState extends State<TabsMobile>{
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialButton(
      color: Colors.black,
      onPressed: (){
        print("HELLO");
        if(widget.title == "Home"){
          Navigator.of(context).pushNamed('/');
        }
        else{
          Navigator.of(context).pushNamed('/' + widget.title);
        }
      },
      child: MouseRegion(
        onEnter: (e){
          setState(() {
            isSelected = true;
          });
        },
        onExit: (e){
          setState(() {
            isSelected = false;
          });
        },
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 100),
          curve: Curves.fastEaseInToSlowEaseOut,
          style: isSelected ? GoogleFonts.oswald(
            shadows: [
              Shadow(color: widget.color ?? Colors.black, offset: const Offset(0, -10,), )],
              color:Colors.transparent,
              fontSize: 25.0,
              decoration: TextDecoration.underline,
              decorationThickness: 1,
              decorationColor: Colors.blue,
            ) : 
            GoogleFonts.oswald(
              color:widget.color ?? Colors.blueAccent,
              fontSize: 23.0
            ),
          child: Text(widget.title),
        ),
      ),
    );
  }
  
}


class SansBold extends StatelessWidget{
  final text;
  final size;
  const SansBold(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text, 
      softWrap: true,
      style: GoogleFonts.openSans(
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  } 
}

class Sans extends StatelessWidget{
  final text;
  final size;
  const Sans(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text, 
      style: GoogleFonts.openSans(
        fontSize: size,
      ),
      softWrap: true,
    );
  }
  
}

class TextForm extends StatelessWidget{
  final heading;
  final width;
  final hintText;
  final maxLine;
  final controller;
  final validator;

  const TextForm({super.key,@required this.heading, @required this.width, @required this.hintText, this.maxLine, this.controller, this.validator});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Sans(heading, 16.0),
                const SizedBox(height: 5.0),
                SizedBox(
                  width: width,
                  
                  child: TextFormField(
                    validator: validator,
                    controller: controller,
                    //RegExp('[a-z]'), only included the lower case letters, no upper case
                    // inputFormatters: [
                    //   FilteringTextInputFormatter.allow(RegExp('[a-zA-Zs]'))
                    // ], Something that you can implement
                    maxLines: maxLine,
                    //How to add decoration around the text form field
                    decoration: InputDecoration(
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(15.0))
                      ),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(15.0))
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color:Colors.lightBlueAccent, width: 2)
                      ),
                      hintText: hintText,
                      hintStyle: GoogleFonts.poppins(fontSize: 14)
                    ),
                    // validator: (text){
                    //   if(RegExp("\\bjason\\b", caseSensitive: false).hasMatch(text.toString())){
                    //     return "Match found";
                    //   }
                    // },
                    // //autovalidates when user interacts with interface
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
              ],
            );
  }

}

class AnimatedCardWeb extends StatefulWidget{
  final imagePath;
  final text;
  final fit;
  final reverese;
  const AnimatedCardWeb({super.key,  @required this.imagePath, @required this.text, this.fit, this.reverese});

  @override
  State<StatefulWidget> createState() =>_AnimatedCardWebState();

}

class _AnimatedCardWebState extends State<AnimatedCardWeb> with SingleTickerProviderStateMixin{

  //Controlling the animations and how long the animations take
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..repeat(reverse: true);

  //Added the animation of for the animation controller to use
  late final Animation<Offset> _animation = Tween(
    begin: widget.reverese == true ? const Offset(0, 0.08) : Offset.zero,
    end: widget.reverese == true ? Offset.zero : const Offset(0, 0.08), 
  ).animate(_controller);

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SlideTransition(
      position: _animation,
      child: Card(
              elevation: 30.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: const BorderSide(color: Colors.blueAccent),
              ),
              shadowColor: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      widget.imagePath, 
                      height: 200,
                      width: 200,
                      fit: widget.fit,
                    ),
                    const SizedBox(height: 10,),
                    Sans(widget.text, 20),
                  ]
                ),
              ),
            ),
    );
  }

}

class AnimatedCard extends StatefulWidget{
  final imagePath;
  final fit;
  final reverese;
  final width;
  final height;
  const AnimatedCard({super.key,  @required this.imagePath, this.fit, this.reverese, @required this.width, @required this.height});

  @override
  State<StatefulWidget> createState() =>_AnimatedCardState();

}

class _AnimatedCardState extends State<AnimatedCard> with SingleTickerProviderStateMixin{

  //Controlling the animations and how long the animations take
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..repeat(reverse: true);

  //Added the animation of for the animation controller to use
  late final Animation<Offset> _animation = Tween(
    begin: widget.reverese == true ? const Offset(0, 0.08) : Offset.zero,
    end: widget.reverese == true ? Offset.zero : const Offset(0, 0.08), 
  ).animate(_controller);

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SlideTransition(
      position: _animation,
      child: Card(
              
              elevation: 30.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: const BorderSide(color: Colors.blueAccent),
              ),
              shadowColor: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      widget.imagePath, 
                      height: widget.height,
                      width: widget.width,
                      fit: widget.fit,
                    ),
                  ]
                ),
              ),
            ),
    );
  }

}

class BlueContainer extends StatelessWidget{
  final text;
  const BlueContainer({super.key, @required this.text});
  
  @override
  Widget build(Object context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
          style:BorderStyle.solid,
          width: 2.0
        ),
        borderRadius: BorderRadius.circular(5)
      ),
      padding: const EdgeInsets.all(10.0),
      child: Text(text)
    );
  }
  
}

class AbelText extends StatelessWidget{
  final text;
  final size;
  final color;
  final fontWeight;
  
  const AbelText({super.key, @required this.text, @required this.size, this.color, this.fontWeight});
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: GoogleFonts.abel(
        fontSize: size,
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}

class AddDataFireStore{
var logger = Logger();
  CollectionReference response = FirebaseFirestore.instance.collection("message");

  Future<bool> addResponse(final firstName, final lastName, final email, final phoneNumber, message) async{
    logger.d("dlajfsdljfklajl");
    return response.add(
      {
        'first name': firstName,
        'last name': lastName,
        'email': email,
        'phone number': phoneNumber,
        'message': message,
      }
    ).then((value) {
      return true;
    }).catchError((error) {
      logger.d("I AM RUNNING");
      logger.d(error);
      return false;
    });
  }
}

Future DialogError(BuildContext context, String title){
  return showDialog(context: context, builder: (BuildContext contexct)=> AlertDialog(
      title: SansBold(title, 30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
    )
  );
}