import 'package:flutter/material.dart';
import 'package:tour_app/utils/repo.dart';
import 'package:tour_app/widgets/custom_cirlce_widget2.dart';
import 'package:tour_app/widgets/custom_cricle_widet.dart';

import 'chat.dart';

class ChatUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return Container(
      child: Column(
        children: <Widget>[
          Card(
            elevation: 15,
            margin: EdgeInsets.all(0),
            child: Container(
              height: screen?h*.1+h*.02:w*.1+w*.02,
              color: Utils.baseColr,
              width: w,
              child: Padding(
                padding: EdgeInsets.only(left: 15,top: screen?h*.06:w*.06),
                child: Text("Messages",
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: screen?h*.03:w*.03),),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                  Column(
                    children: List.generate(100, ((index){
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, Utils.createRoute(page: Chat()));
                        },
                        child: Padding(
                          padding: EdgeInsets.all(14),
                          child: Row(
                            children: <Widget>[
                              ((index+1) % 2 == 0) ?
                              CustomCircleWidget(
                                wdth: l/13.3,
                                hght: l/13.3,
                                hght1: l/14,
                                wdth1: l/14,
                              ) :
                              CustomCircleWidget2(
                                wdth: l/14,
                                hght: l/14,
                              ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("John Doe",style: TextStyle(color: Utils.baseColr,fontWeight: FontWeight.bold,fontSize: screen?h*.02:w*.02),),
                                Text("Lorem ipsum doller set. Lorem ipsum doller set. Lorem ipsum doller set. Lorem ipsum doller set."
                                ,style: TextStyle(color: Utils.baseColr,fontSize: screen?h*.02:w*.02),
                                ),
                              ],
                            ),
                          ),
                              Text("9:00",style: TextStyle(color: Utils.baseColr,fontSize: screen?h*.02:w*.02,)),
                        ],
                          ),
                        ),
                      );
                    })),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
