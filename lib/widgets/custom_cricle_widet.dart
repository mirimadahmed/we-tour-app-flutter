import 'package:flutter/material.dart';
import 'package:tour_app/utils/repo.dart';
import 'package:transparent_image/transparent_image.dart';

class CustomCircleWidget extends StatelessWidget {
  final double wdth;
  final double wdth1;
  final double hght;
  final double hght1;
  final bool isBorder;
  final String image;
  CustomCircleWidget({this.wdth,this.hght, this.wdth1, this.hght1, this.isBorder = false, this.image});
  @override
  Widget build(BuildContext context) {
    Orientation orien = MediaQuery.of(context).orientation;
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    bool screen = orien == Orientation.portrait ? true:false;
    return Card(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100)
      ),
      elevation: 5,
      child: Stack(
        children: <Widget>[
          isBorder ? Container():Container(
            width: wdth ?? l/8,
            height: hght ?? l/8,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color:Colors.deepPurple,width: 2)
            ),
          ),
          Container(
            width: wdth1 ?? l/8,
            height: hght1 ?? l/8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: isBorder ? Utils.baseColr : Colors.transparent,width: 2)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
