
import 'package:flutter/material.dart';

class ImageSwitch extends StatefulWidget {
  @override
  ImageSwitchState createState() => ImageSwitchState();
}

class ImageSwitchState extends State<ImageSwitch> {
  int current = 0;
  List<String> images = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
    "assets/images/5.png",
  ];

  void switchImage (){

    setState(() {
      if(current + 1 >= images.length){
        current = 0;
      }else{
        current = current +1;
      }
      print("Показываю картинку: ${current+1}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: switchImage,
      child: Container(
        width: 140,
        height: 220,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            images[current],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}