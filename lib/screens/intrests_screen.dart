import 'package:flutter/material.dart';
import 'package:tour_app/utils/repo.dart';
import 'package:tour_app/widgets/custom_button.dart';
import 'package:transparent_image/transparent_image.dart';

import 'followinitial.dart';

class IntrestPage extends StatelessWidget {
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
        height: h,
        width: w,
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: screen?h*.09:w*.09,),
              Text.rich(
                TextSpan(
                  text: 'Hi ',
                  children: [
                    TextSpan(
                      text: 'Imad',
                      style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromRGBO(17, 141, 150, 1.0))
                    ),
                    TextSpan(
                      text: ", where do you "
                    ),
                  ]
                ),
                style: TextStyle(fontWeight: FontWeight.w500,fontSize: screen?w*.06:h*.06,color: Utils.baseColr),
              ),
              Text("want to travel next?",style: TextStyle(fontWeight: FontWeight.w500,fontSize: screen?w*.06:h*.06,color: Utils.baseColr),),
              SizedBox(height: 10,),
              Text("Select 3 or places",style: TextStyle(color: Utils.baseColr.withOpacity(0.7),fontWeight: FontWeight.w600,fontSize: screen?w*.04:h*.04),),
              Flexible(
                child: Stack(
                  children: <Widget>[
                    GridView.builder(
                      itemCount: 16,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: screen ?2:3
                      ),
                      itemBuilder: (context, index){
                        return Container(
                          padding: EdgeInsets.all(10),
                          child: Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  color: Colors.grey.withOpacity(0.2),
                                  child: FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: 'https://picsum.photos/250?image=9',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 10,
                                bottom: 10,
                                child: Text("Hunza",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              ),
                              Positioned(
                                right: 10,
                                bottom: 10,
                                child: Container(
                                  width: l/40,
                                  height: l/40,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white,width: 2),
                                    borderRadius: BorderRadius.circular(100)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
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
                          Navigator.push(context, Utils.createRoute(page: FollowInitial()));
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
