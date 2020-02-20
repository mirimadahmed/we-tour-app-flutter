import 'package:flutter/material.dart';
import 'package:tour_app/screens/people_page.dart';
import 'package:tour_app/screens/place_details_page.dart';
import 'package:tour_app/screens/see_all_details_page.dart';
import 'package:tour_app/utils/repo.dart';
import 'package:tour_app/widgets/custom_timeline_horizenal.dart';
import 'package:tour_app/widgets/header_section_widget.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    List<String>  _list = ["https://magoo-app.s3.amazonaws.com/we-tour/Travel-PNG-High-Quality-Image.png"
      ,"https://magoo-app.s3.amazonaws.com/we-tour/pngfuel.com.png",
      "https://magoo-app.s3.amazonaws.com/we-tour/travel-family-royalty-free-png-favpng-ZVB66hX8yeF3N5gandxC2RuHb.jpg"
    ];
    List<String> _listText = ["1","2","3"];
    return Container(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: screen?h*.4:w*.4,
              width: w,
              child: Center(
                child: HeaderSection(
                  imageList: _list,
                  title: _listText,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 14,top: 10),
                      child: Text("Discover",style: TextStyle(fontWeight: FontWeight.bold,fontSize: screen?w*.05:h*.05,color: Utils.baseColr),),
                    ),
                    SizedBox(height: screen?h*.03:w*.03,),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          width: w*.9,
                          height: screen ? h*.07:w*.07,
                          color: Utils.baseColr,
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.search,color: Colors.white,),
                              SizedBox(width: 10,),
                              Expanded(child: TextField(
                                style: TextStyle(color: Colors.white),
                                cursorColor: Colors.white,
                                decoration: InputDecoration.collapsed(
                                    hintText: "Type here to search",hintStyle: TextStyle(color: Colors.white)),
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screen?h*.01:w*.01,),
                    CustomHorizental("Featured Experience",
                    onPressed: (){
                      Navigator.push(context, Utils.createRoute(page: SeeAllDetailsPage()));
                    },),
                    CustomHorizental("3rd party tours",
                      onPressed: (){
                        Navigator.push(context, Utils.createRoute(page: SeeAllDetailsPage(isTrip: true,)));
                      },),
                    CustomHorizental("Top journeys",
                      onPressed: (){
                        Navigator.push(context, Utils.createRoute(page: SeeAllDetailsPage(isTrip: true,)));
                      },),
                    CustomHorizental("Hot Places",
                    onPressed: (){
                      Navigator.push(context, Utils.createRoute(page: PlaceDetailsPage()));
                    },),
                    CustomHorizental("Popular people",isPeole: true,
                    onTapPic: (){
                      Navigator.push(context, Utils.createRoute(page: PeoplePage()));
                    },
                    ),
                    SizedBox(height: 20,),
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
