import 'package:flutter/material.dart';
import 'package:tour_app/utils/repo.dart';

class SeeCustomContainer extends StatelessWidget {
  final List<String> testxList;
  const SeeCustomContainer({Key key, this.testxList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: l/6,
        decoration: BoxDecoration(
          color: Utils.baseColr,
            borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(testxList.length, ((index){
            return Text(testxList[index],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: screen?h*.03:w*.03),);
          })),
        ),
      ),
    );
  }
}
