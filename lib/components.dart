import 'package:flutter/material.dart';
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
                    maxLines: maxLine == null ? null: maxLine,
                    //How to add decoration around the text form field
                    decoration: InputDecoration(
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
                  ),
                ),
              ],
            );
  }

}
