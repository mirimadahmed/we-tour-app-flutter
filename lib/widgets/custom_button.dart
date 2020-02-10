import 'package:flutter/material.dart';
import 'package:tour_app/screens/auth_page.dart';
import 'package:tour_app/utils/repo.dart';


class CustomButton extends StatelessWidget {
  final double w1;
  final double h2;
  final String text;
  final VoidCallback onPressed;
  CustomButton({Key key, this.w1, this.h2, this.text, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return Container(
      width: w1,
      height: h2,
      decoration: BoxDecoration(
        color: Utils.baseColr,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Utils.baseColr.withOpacity(0.5),
            blurRadius: 20.0, // soften the shadow
            spreadRadius: 0.0, //extend the shadow
            offset: Offset(
              5.0, // Move to right 10  horizontally
              5.0, // Move to bottom 10 Vertically
            ),
          ),
        ]
      ),
      child: RawMaterialButton(
        splashColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(text, style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: screen?w*.06:h*.06),),
        ),
      ),
    );
  }
}
