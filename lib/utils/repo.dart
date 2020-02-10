

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Utils{
  static final Color baseColr = Color.fromRGBO(23, 160, 170, 1.0);


  static Route createRoute({Widget page}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.fastLinearToSlowEaseIn;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if(image != null){
      return image;
    }else{
      return null;
    }
  }
  Future getCamera()async{
    var image = await ImagePicker.pickImage(source: ImageSource.camera );
    if(image != null){
      return image;
    }else{
      return null;
    }
  }

  Future<String> slelectedDate(context)async{
    DateTime seleted = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2050),
        builder: (context, Widget child){
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor:  Utils.baseColr,//Head background
              accentColor:  Utils.baseColr,
            ),
            child: child,
          );
        }
    );
    if(seleted != null){
      return DateFormat("EEEE, d MMM, yyyy").format(seleted).toString();
    }else{
      return null;
    }
  }

  TimeOfDay _time = TimeOfDay.now();
  Future<String> slelectedTime(context)async{
    TimeOfDay selectedTime = await showTimePicker(context: context, initialTime: _time);
    if(selectedTime != null){
      return selectedTime.format(context).toString();
    }
    else{
      return null;
    }
  }
}