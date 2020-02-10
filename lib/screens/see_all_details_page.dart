import 'package:flutter/material.dart';
import 'package:tour_app/utils/repo.dart';
import 'package:tour_app/widgets/custom_button.dart';
import 'package:tour_app/widgets/goint_to_back.dart';
import 'package:tour_app/widgets/sellcustom_widget.dart';
import 'package:transparent_image/transparent_image.dart';

class SeeAllDetailsPage extends StatelessWidget {
  final bool isTrip;
  SeeAllDetailsPage({this.isTrip = false});
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    List<String> _liest = ["300", "per person",];
    List<String> _liesTrip = ["300", "per person", "per day"];
    List<String> _liest1 = ["Hiking", "20 minutes","300 PKR"];
    List<String> _listTripData = ["Hiking", "20 minutes"];
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
                  image: 'https://picsum.photos/250?image=9',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: screen?h*.07:w*.07),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: screen?h*.02:w*.02,top: screen?h*.05:w*.05),
                        child: Text(isTrip ? "4 day trip to Swat - Tour operator" :"Hunza",style: TextStyle(fontWeight: FontWeight.bold,fontSize: screen?w*.05:h*.05,color: Utils.baseColr),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 14,top: screen?h*.01:w*.01),
                        child: Text(isTrip ? "21-10-2020 - 21-10-2020" :"about place",style: TextStyle(fontSize: screen?w*.04:h*.04,color: Utils.baseColr),),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screen?h*.04:w*.04,right: screen?h*.02:w*.02),
                child: SeeCustomContainer(
                  testxList: isTrip ? _liesTrip :_liest,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: screen?h*.02:w*.02,top: screen?h*.008:w*.008),
            child: Text(isTrip ? "Schedule" :"Activities",style: TextStyle(fontWeight: FontWeight.bold,fontSize: screen?w*.05:h*.05,color: Utils.baseColr),),
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    children: List.generate(10, ((index){
                      return Padding(
                          padding: EdgeInsets.only(top: screen?h*.008:w*.008,left: 10,right: 10),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                            ),
                            elevation: 3,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal:8,vertical: 10 ),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: isTrip ? 1 : 5,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: List.generate(isTrip ? _listTripData.length :_liest1.length, ((index){
                                        if(isTrip == true)
                                        return Text(_listTripData[index],style: TextStyle(color: Utils.baseColr,fontWeight: FontWeight.bold,fontSize: screen?w*.04:h*.04),);
                                        return Expanded(child: Text(isTrip ? _listTripData[index] :_liest1[index],style: TextStyle(color: Utils.baseColr,fontWeight: FontWeight.bold,fontSize: screen?w*.04:h*.04),));
                                      })),
                                    ),
                                  ),
                                  isTrip ? Container() :Spacer(),
                                  isTrip ? Container() :Container(
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        color: Utils.baseColr,
                                        borderRadius: BorderRadius.circular(100)
                                    ),
                                    child: Center(
                                      child: Icon(Icons.check,size: screen?h*.04:w*.04,color: Colors.white,),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                      );
                    })),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: screen?h*.04:w*.04),
                    child: CustomButton(
                      text: isTrip ? "REQUEST TO JOIN" :"BOOK NOW",
                      h2: screen?h*.07:w*.07,
                      w1: w*.9,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
