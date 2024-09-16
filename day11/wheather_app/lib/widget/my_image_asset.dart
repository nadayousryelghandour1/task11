import 'package:flutter/material.dart';

Widget myImageAsset ({
  String ? imagePath
}){
  return Image.asset(
       imagePath!,
       height: 50,
       width: 50,
      );
}