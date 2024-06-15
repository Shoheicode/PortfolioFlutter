import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class TabsWeb extends StatefulWidget{
  final title;
  const TabsWeb(this.title, {super.key});

  @override
  State<StatefulWidget> createState() =>_TabsWebState();

}

class _TabsWebState extends State<TabsWeb>{
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MouseRegion(
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
          shadows: [Shadow(color:Colors.black, offset: Offset(0, -10,), )],
            color:Colors.transparent,
            fontSize: 25.0,
            decoration: TextDecoration.underline,
            decorationThickness: 1,
            decorationColor: Colors.blue,
          ) : 
          GoogleFonts.oswald(
            color:Colors.black,
            fontSize: 23.0
          ),
        child: Text(widget.title),
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
    );
  }
  
}

class TextForm extends StatelessWidget{
  final heading;
  final width;
  final hintText;
  final maxLine;

  const TextForm({super.key,@required this.heading, @required this.width, @required this.hintText, this.maxLine});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Sans(heading, 16.0),
                SizedBox(height: 5.0),
                SizedBox(
                  width: width,
                  
                  child: TextFormField(
                    //RegExp('[a-z]'), only included the lower case letters, no upper case
                    // inputFormatters: [
                    //   FilteringTextInputFormatter.allow(RegExp('[a-zA-Zs]'))
                    // ], Something that you can implement
                    maxLines: maxLine == null ? null: maxLine,
                    //How to add decoration around the text form field
                    decoration: InputDecoration(
                      focusedErrorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
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
  late AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..repeat(reverse: true);

  //Added the animation of for the animation controller to use
  late Animation<Offset> _animation = Tween(
    begin: widget.reverese == true ? Offset(0, 0.08) : Offset.zero,
    end: widget.reverese == true ? Offset.zero : Offset(0, 0.08), 
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
                side: BorderSide(color: Colors.blueAccent),
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
                      fit: widget.fit == null ? null : widget.fit,
                    ),
                    SizedBox(height: 10,),
                    Sans(widget.text, 20)
                  ]
                ),
              ),
            ),
    );
  }

}