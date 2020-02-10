import 'package:flutter/material.dart';
import 'package:tour_app/screens/travel_history_initial.dart';
import 'package:tour_app/utils/repo.dart';
import 'package:tour_app/widgets/custom_button.dart';
import 'package:transparent_image/transparent_image.dart';

class FollowInitial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: w,
        height: h,
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: screen?h*.09:w*.09,),
              Text("And follow travel lovers",style: TextStyle(fontWeight: FontWeight.w400,fontSize: screen?w*.06:h*.06,color: Utils.baseColr),),
              Text("Who have interests like you",style: TextStyle(fontWeight: FontWeight.w400,fontSize: screen?w*.06:h*.06,color: Utils.baseColr),),
              Flexible(
                child: Stack(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Column(
                        children: List.generate(10, ((index){
                          return Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left:w*.1,top: screen?h*.04:w*.04),
                                decoration: BoxDecoration(
                                    border: Border.all(color:Utils.baseColr,width: 4),
                                    borderRadius: BorderRadius.circular(200)
                                ),
                                width: l/10,
                                height: l/10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: 'https://picsum.photos/250?image=9',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Padding(
                                padding: EdgeInsets.only(top: screen?h*.04:w*.04),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("John Doe",style: TextStyle(fontWeight: FontWeight.bold,fontSize: screen?w*.04:h*.04,color: Utils.baseColr),),
                                    Text("Turky",style: TextStyle(fontWeight: FontWeight.w400,fontSize: screen?w*.03:h*.03,color: Utils.baseColr),),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.only(top: screen?h*.04:w*.04,right: 50),
                                child: Container(
                                 width: w*.2,
                                 height: screen?h*.03:w*.03,
                                 decoration: BoxDecoration(
                                   border: Border.all(color: Utils.baseColr),
                                   borderRadius: BorderRadius.circular(6),
                                 ),
                                  child: Center(
                                    child: Text(
                                      "Follow",style: TextStyle(fontSize: screen?w*.03:h*.03,color: Utils.baseColr),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        })),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      right: 20,
                      child: CustomButton(
                        w1: w,
                        h2: screen?h*.08:w*.08,
                        text: 'Next',
                        onPressed: (){
                          Navigator.push(context, Utils.createRoute(page: TravelHistoryInitial()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
