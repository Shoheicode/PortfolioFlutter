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
