import 'package:flutter/material.dart';
import 'package:tour_app/utils/repo.dart';

import 'listing_image.dart';

class CustomCircleWidget2 extends StatelessWidget {
  final double wdth;
  final double hght;
  CustomCircleWidget2({this.wdth,this.hght});
  @override
  Widget build(BuildContext context) {
    Orientation orien = MediaQuery.of(context).orientation;
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    bool screen = orien == Orientation.portrait ? true:false;
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Utils.baseColr,width: 4),
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              blurRadius: 40.0, // soften the shadow
              spreadRadius: 1.0, //extend the shadow
              offset: Offset(
                1.0, // Move to right 10  horizontally
                5.0, // Move to bottom 10 Vertically
              ),
            ),
          ]
      ),
      child: HomeImage(
        borderRadius: BorderRadius.circular(100),
        w: wdth ?? l/7.8,
        h: hght ?? l/7.8,
      ),
    );
  }
}
