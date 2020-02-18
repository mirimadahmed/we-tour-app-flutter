import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_app/bloc_pattern/bloc_service.dart';
import 'package:tour_app/screens/travel_history_main.dart';
import 'package:tour_app/utils/repo.dart';
import 'package:tour_app/widgets/custom_button.dart';
import 'package:tour_app/widgets/custom_switch.dart';
import 'package:tour_app/widgets/text_field_widget.dart';

import 'bottom_widget_class.dart';
import 'invite_friend.dart';


class TravelHistoryInitial extends StatelessWidget {
  final bool newTrip;
  const TravelHistoryInitial({Key key, this.newTrip=false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<BlocServices>(context);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return Scaffold(
      body: Column(
        children: <Widget>[
          newTrip ?Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: screen?h*.04:w*.04,left: 10),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
                onPressed:(){
                  Navigator.pop(context);
                },
              ),
            ),
          ):Container(),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: newTrip ? (screen?h*.05:w*.05) : (screen?h*.06:w*.06),),
                    newTrip ?
                    Text("Create a new trip",style: TextStyle(fontWeight: FontWeight.bold,fontSize: screen?w*.05:h*.05,color: Utils.baseColr),):
                    Column(
                      children: <Widget>[
                        Text("Let’s start by sharing",style: TextStyle(fontWeight: FontWeight.w400,fontSize: screen?w*.06:h*.06,color: Utils.baseColr),),
                        Text("adventures you have done",style: TextStyle(fontWeight: FontWeight.w400,fontSize: screen?w*.06:h*.06,color: Utils.baseColr),),
                        Text("so people can know you",style: TextStyle(fontWeight: FontWeight.w400,fontSize: screen?w*.06:h*.06,color: Utils.baseColr),),
                        Text("better",style: TextStyle(fontWeight: FontWeight.w400,fontSize: screen?w*.06:h*.06,color: Utils.baseColr),),
                      ],
                    ),
                    SizedBox(height:  newTrip ? (screen?h*.02:w*.02) : 0.0,),
                    CustomTextFieldWidget(
                      labelText: 'Name your trip',
                      hintText: '',
                    ),
                    CustomTextFieldWidget(
                      labelText: 'Trip started from',
                      hintText: '',
                    ),
                    CustomTextFieldWidget(
                      labelText: 'Destination',
                      hintText: '',
                    ),
                    SizedBox(height: screen?h*.02:w*.02,),
                    Align(alignment: Alignment.centerLeft,child: Text("Dates",style:TextStyle(fontSize: screen ? w*.04:h*.04,fontWeight: FontWeight.bold,color: Color.fromRGBO(17, 141, 150, 1.0)))),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              InkWell(
                                onTap: () => bloc.dateFromCheck(context),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(child: Text(bloc.datefrom ?? "Date from",style:TextStyle(fontSize: screen ? w*.04:h*.04,fontWeight: FontWeight.bold,color: Color.fromRGBO(17, 141, 150, 1.0).withOpacity(0.7)))),
                                    Icon(Icons.date_range,color: Utils.baseColr,),
                                  ],
                                ),
                              ),
                              Container(
                                height: 1,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              InkWell(
                                onTap: () => bloc.dateToCheck(context),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(child: Text(bloc.dateTo ?? "Date to",style:TextStyle(fontSize: screen ? w*.04:h*.04,fontWeight: FontWeight.bold,color: Color.fromRGBO(17, 141, 150, 1.0).withOpacity(0.7)))),
                                    Icon(Icons.date_range,color: Utils.baseColr,),
                                  ],
                                ),
                              ),
                              Container(
                                height: 1,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: CustomTextFieldWidget(
                              labelText: 'Budget',
                              hintText: '',
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: screen? h*.02:w*.02,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("per day",style:TextStyle(fontSize: screen ? w*.04:h*.04,fontWeight: FontWeight.bold,color: Color.fromRGBO(17, 141, 150, 1.0))),
                                  CustomSwitch(
                                    setting: true,
                                    long: l/20,
                                    w1: w*0.2,
                                    h1: screen ? h*.05 : w*.06,
                                    activeColor: Utils.baseColr,
                                    value: bloc.perday,
                                    onChanged: (v)=>bloc.perDayChec,
                                  ),
                                ],
                              ),
                              SizedBox(height: screen? h*.01:w*.01,),
                              Container(
                                height: 1,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height:  newTrip ? (screen?h*.1:w*.1) : screen?h*.02:w*.02,),
                    !newTrip ?Column(
                      children: <Widget>[
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Text("What’s next?",style: TextStyle(fontSize: screen?w*.06:h*.06,fontWeight: FontWeight.bold,color: Color.fromRGBO(17, 141, 150, 1.0)),)
                        ),
                        SizedBox(height: screen?h*.01:w*.01,),
                        Text("You can add step by step story of your adventure",style: TextStyle(fontWeight: FontWeight.w400,fontSize: screen?w*.05:h*.05,color: Utils.baseColr),),
                        SizedBox(height: screen?h*.04:w*.04,),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: CustomButton(
                                text: 'Next',
                                onPressed: (){
                                  Navigator.push(context, Utils.createRoute(page: TravelHistoryMain()));
                                },
                              ),
                            ),
                            SizedBox(width: 20,),
                            Expanded(
                              child: CustomButton(
                                text: 'Skip',
                                onPressed: (){
                                  Navigator.pushAndRemoveUntil(context, Utils.createRoute(page: BottomFittnessPage()),(Route<dynamic> route) => false);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ) :
                    CustomButton(
                      text: "Next",
                      onPressed: (){
                        Navigator.push(context, Utils.createRoute(page:InviteFriends()));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
