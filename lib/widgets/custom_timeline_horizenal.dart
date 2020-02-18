import 'package:flutter/material.dart';
import 'package:tour_app/utils/repo.dart';
import 'package:transparent_image/transparent_image.dart';

import 'custom_cricle_widet.dart';

class CustomHorizental extends StatelessWidget {
  final String headfing;
  final bool isPeole;
  final GestureTapCallback onPressed;
  CustomHorizental(this.headfing,{this.isPeole = false, this.onPressed});
  Widget build(BuildContext context) {
    Orientation orien = MediaQuery.of(context).orientation;
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    bool screen = orien == Orientation.portrait ? true:false;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 14,top: screen?h*.04:w*.04,right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(headfing,style: TextStyle(fontWeight: FontWeight.bold,fontSize: screen?w*.05:h*.05,color: Utils.baseColr),),
              InkWell(
                  onTap: onPressed,
                  child: Text("see all",style: TextStyle(fontSize: screen?w*.04:h*.04,color: Utils.baseColr),)),
            ],
          ),
        ),
        SizedBox(height: screen ? h*.03:w*.03,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: List.generate(10, ((index){
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      isPeole ? Container():Card(
                        color: Colors.transparent,
                        elevation: 5,
                        child: Container(
                          width: l/7,
                          height: l/7,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: 'https://picsum.photos/250?image=9',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      isPeole ?
                      CustomCircleWidget(
                        image: 'https://picsum.photos/250?image=9',
                      ):
                      Container(),
                      SizedBox(
                        height: 2,
                      ),
                      Padding(
                        padding:EdgeInsets.only(left: 5),
                        child: Text("Munich",style: TextStyle(fontWeight: FontWeight.bold,fontSize: screen?w*.03:h*.03,color: Utils.baseColr),),
                      ),
                      Padding(
                        padding:EdgeInsets.only(left: 5),
                        child: Text("Switzerland",style: TextStyle(fontSize: screen?w*.03:h*.03,color: Utils.baseColr),),
                      ),
                    ],
                  ),
                );
              }))
          ),
        ),
      ],
    );

  }
}
