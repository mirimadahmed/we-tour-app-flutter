import 'package:flutter/material.dart';
import 'package:tour_app/screens/travel_history_initial.dart';
import 'package:tour_app/utils/repo.dart';
import 'package:tour_app/widgets/custom_button.dart';
import 'package:tour_app/widgets/custom_timeline_horizenal.dart';
import 'package:transparent_image/transparent_image.dart';


class MyTrips extends StatelessWidget {
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
          Container(
            color: Utils.baseColr,
            width: w,
            height: screen?h*.3 : w*.2,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: screen?h*.1+h*.05:w*.08,left: screen?w*.03:h*.03),
                  child: Text("My Tours",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: screen?w*.05:h*.05),),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(top:screen?h*.2:w*.1,right: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      width: l/13,
                      height: l/13,
                      child:FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: 'https://magoo-app.s3.amazonaws.com/we-tour/183223496.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 14,top: screen?h*.02:w*.02,bottom: screen?h*.02:w*.0),
                      child: Text("Upcoming tours ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: screen?w*.04:h*.04,color: Utils.baseColr),),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: w*.9,
                      height: screen?h*.3:w*.3,
                      child:FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: 'https://magoo-app.s3.amazonaws.com/we-tour/183223496.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 14,top: screen?h*.02:w*.02),
                      child: Text("2 day hunza retreate",style: TextStyle(fontWeight: FontWeight.bold,fontSize: screen?w*.04:h*.04,color: Utils.baseColr),),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 14,top: screen?h*.01:w*.01),
                      child: Text("Humza, GB",style: TextStyle(fontWeight: FontWeight.bold,fontSize: screen?w*.03:h*.03,color: Utils.baseColr),),
                    ),
                  ),
                  SizedBox(height: screen?h*.03:w*.03,),
                  CustomButton(
                    w1: w*.9,
                    text: "CREATE NEW TOUR",
                    onPressed: (){
                      Navigator.push(context, Utils.createRoute(page: TravelHistoryInitial(newTrip: true,)));
                    },
                  ),
                  CustomHorizental("Past tours"),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
