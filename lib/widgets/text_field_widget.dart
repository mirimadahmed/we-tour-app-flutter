import 'package:flutter/material.dart';
import 'package:tour_app/utils/repo.dart';


class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText, hintText;
  final TextInputType inputType;
  CustomTextFieldWidget({this.controller, this.labelText, this.hintText, this.inputType});
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return Container(
      width: w,
      child: Column(
        children: <Widget>[
          TextFormField(
            scrollPadding: EdgeInsets.all(0),
            controller: controller,
            keyboardType: inputType,
            cursorColor: Utils.baseColr,
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: TextStyle(color: Utils.baseColr, fontSize:screen? w*.04:h*.04, fontWeight: FontWeight.bold),
              hintText: hintText,
              hintStyle: TextStyle(color: Utils.baseColr),
              enabledBorder: UnderlineInputBorder(
                borderSide:
                BorderSide(color: Colors.black38),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Utils.baseColr,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}