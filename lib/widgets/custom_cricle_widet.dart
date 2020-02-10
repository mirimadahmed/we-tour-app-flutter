import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class CustomCircleWidget extends StatelessWidget {
  final double wdth;
  final double wdth1;
  final double hght;
  final double hght1;
  CustomCircleWidget({this.wdth,this.hght, this.wdth1, this.hght1});
  @override
  Widget build(BuildContext context) {
    Orientation orien = MediaQuery.of(context).orientation;
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    bool screen = orien == Orientation.portrait ? true:false;
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100)
      ),
      elevation: 5,
      child: Stack(
        children: <Widget>[
          Container(
            width: wdth ?? l/7.8,
            height: hght ?? l/7.8,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.deepPurple,width: 2)
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: screen?h*.003:w*.003,left: screen?w*.004:h*.004),
            width: wdth1 ?? l/8,
            height: hght1 ?? l/8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: 'https://picsum.photos/250?image=9',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
