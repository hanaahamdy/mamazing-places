import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../app_text/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  double? width;
  Color? color;
  bool? isResponsive;
  double? height;
  String? text;

  ResponsiveButton(
      {this.color, this.width, this.isResponsive = false, this.height = 50,this.text=""});

  @override
  Widget build(BuildContext context) {
    return Container(height: height,width: width,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Row(mainAxisAlignment: MainAxisAlignment.center ,
        children: [
          AppText(text:text!,color: Colors.white,),
          Image(
            image: AssetImage("images/button-one.png"),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Color(0xFF5d69b3),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
