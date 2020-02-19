import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tour_app/screens/place_details_page.dart';
import 'package:tour_app/utils/repo.dart';
import 'package:tour_app/widgets/custom_button.dart';
import 'package:tour_app/widgets/custom_cirlce_widget2.dart';
import 'package:tour_app/widgets/goint_to_back.dart';


class PeoplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  color: Utils.baseColr,
                  width: w,
                  height: screen?h*.2 : w*.2,
                ),
                Positioned(
                  bottom: -l/16,
                  left: 20,
                  child: Container(
                    width: w,
                    child: Row(
                      children: <Widget>[
                        CustomCircleWidget2(),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(top: screen?h*.07:w*.07),
                          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Center(
                            child: Text("Message",style: TextStyle(fontWeight: FontWeight.bold,color: Utils.baseColr,fontSize: screen?w*.03:h*.03),),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          margin: EdgeInsets.only(right: 40,top: screen?h*.07:w*.07),
                          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Center(
                            child: Text("Foollow",style: TextStyle(fontWeight: FontWeight.bold,color: Utils.baseColr,fontSize: screen?w*.03:h*.03),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
               Padding(
                 padding: const EdgeInsets.only(top: 30,left: 10),
                 child: BackArrow(
                   onTap: (){
                     Navigator.pop(context);
                   },
                 ),
               ),
              ],
            ),
            SizedBox(height: screen?h*.06:w*.06,),
            Padding(
              padding: EdgeInsets.only(right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("89K",style: TextStyle(color: Utils.baseColr,fontSize: screen?w*.02:h*.02,fontWeight: FontWeight.bold),),
                      Text("Followers",style: TextStyle(color: Utils.baseColr,fontSize: screen?w*.02:h*.02,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(width: 20,),
                  Column(
                    children: <Widget>[
                      Text("89K",style: TextStyle(color: Utils.baseColr,fontSize: screen?w*.02:h*.02,fontWeight: FontWeight.bold),),
                      Text("Followers",style: TextStyle(color: Utils.baseColr,fontSize: screen?w*.02:h*.02,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: screen?h*.03:w*.03,),
                    Padding(
                      padding: EdgeInsets.only(top: screen?h*.01:w*.01,left: screen?w*.05:h*.05),
                      child: Text("John Doe",style: TextStyle(color: Utils.baseColr,fontWeight: FontWeight.bold,fontSize: screen?w*.05:h*.05),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screen?h*.001:w*.001,left: screen?w*.05:h*.05),
                      child: Text("Islamabad, Pk",style: TextStyle(color: Utils.baseColr,fontWeight: FontWeight.bold,fontSize: screen?w*.03:h*.03),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screen?h*.05:w*.05,left: screen?w*.05:h*.05),
                      child: Text("I am a travel lover, I want to travel all the countries in the world. I am 25 years old and I love making friends who I can travel with and discuss the knowledge.",style: TextStyle(color: Utils.baseColr,fontWeight: FontWeight.bold,fontSize: screen?w*.03:h*.03),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screen?h*.03:w*.03,left: screen?w*.05:h*.05),
                      child: Text("Let’s chat and plan our next trip.",style: TextStyle(color: Utils.baseColr,fontWeight: FontWeight.bold,fontSize: screen?w*.03:h*.03),),
                    ),
                    Container(
                      height: screen?h*.1:w*.1,
                      margin: EdgeInsets.only(top: screen?h*.03:w*.03,left: screen?w*.05:h*.05),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),border: Border.all(color: Colors.grey)
                      ),
                      padding: EdgeInsets.only(left: 10,right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: screen?h*.02:w*.02,),
                          Text("CHEKC IN",style: TextStyle(color: Utils.baseColr,fontWeight: FontWeight.bold,fontSize: screen?w*.03:h*.03),),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text("28",style: TextStyle(color: Utils.baseColr,fontWeight: FontWeight.bold,fontSize: screen?w*.06:h*.06),),
                              Padding(
                                padding: EdgeInsets.only(top: screen?h*.01:w*.01),
                                child: Text("Places",style: TextStyle(color: Utils.baseColr,fontWeight: FontWeight.bold,fontSize: screen?w*.03:h*.03),),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
