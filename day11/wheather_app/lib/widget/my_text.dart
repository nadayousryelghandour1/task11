import 'package:flutter/material.dart';

Widget myText(
   {
  double fontSize = 0.0,
  String  text='',
  bool bold = false
}){
  if(bold){
    return Text(
    text,
     style: TextStyle(
         fontSize: fontSize,
         color: Colors.white,
         fontWeight: FontWeight.bold
  )
  );
}
  else{
    return Text(
    text,
     style: TextStyle(
         fontSize: fontSize,
         color: Colors.white,
  )
  );
  }
  
}