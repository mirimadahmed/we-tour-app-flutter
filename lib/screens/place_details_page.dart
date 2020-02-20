import 'package:flutter/material.dart';
import 'package:tour_app/screens/see_all_details_page.dart';
import 'package:tour_app/utils/repo.dart';
import 'package:tour_app/widgets/custom_timeline_horizenal.dart';
import 'package:tour_app/widgets/goint_to_back.dart';
import 'package:transparent_image/transparent_image.dart';

class PlaceDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                color: Colors.grey.withOpacity(0.5),
                width: w,
                height: screen?h*.2+h*.02:w*.2,
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: 'https://magoo-app.s3.amazonaws.com/we-tour/183223496.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                  top: screen ? h*.06 : w*.06,
                  left: 20,
                  child: BackArrow(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                  )),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 14,top: screen?h*.05:w*.05),
                    child: Text("Hunza",style: TextStyle(fontWeight: FontWeight.bold,fontSize: screen?w*.06:h*.06,color: Utils.baseColr),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 14,top: screen?h*.01:w*.01),
                    child: Text("about place",style: TextStyle(fontSize: screen?w*.05:h*.05,color: Utils.baseColr),),
                  ),
                  CustomHorizental("Experiences",onPressed: (){
                    Navigator.push(context, Utils.createRoute(page: SeeAllDetailsPage()));
                  },),
                  CustomHorizental("Trips",onPressed: (){
                    Navigator.push(context, Utils.createRoute(page: SeeAllDetailsPage(isTrip: true,)));
                  },),
                  CustomHorizental("People",isPeole: true),
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
