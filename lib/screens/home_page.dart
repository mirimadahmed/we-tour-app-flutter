import 'package:flutter/material.dart';
import 'package:tour_app/utils/repo.dart';
import 'package:tour_app/widgets/custom_timeline_horizenal.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return Container(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: w,
                  height: h*.3,
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: 'https://picsum.photos/250?image=9',
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: 12,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 5,top: 5,left: 13),
                    width: w,
                  color: Colors.black54,
                    child: Text("Heading", style: TextStyle(fontSize: screen?w*.04:h*.04,fontWeight: FontWeight.bold,color: Colors.white),),
                  ),
                ),
              ],
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
                    CustomHorizental("Featured Experience"),
                    CustomHorizental("3rd party tours"),
                    CustomHorizental("Top journeys"),
                    CustomHorizental("Hot Places"),
                    CustomHorizental("Popular people",isPeole: true),
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
