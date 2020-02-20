import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_app/bloc_pattern/bloc_service.dart';
import 'package:tour_app/screens/travel_history_initial.dart';
import 'package:tour_app/utils/repo.dart';
import 'package:tour_app/widgets/custom_button.dart';
import 'package:tour_app/widgets/custom_cricle_widet.dart';
import 'package:transparent_image/transparent_image.dart';

class FollowInitial extends StatelessWidget {
  List<FollowingModel> _list = [
    FollowingModel(image: "https://www.pngarts.com/files/3/Smiling-Man-PNG-Image-Background.png",name: "John Doe",state: "Turkey"),
    FollowingModel(image: "https://www.pngarts.com/files/3/Smiling-Man-PNG-Image-Background.png",name: "John Doe",state: "Turkey"),
    FollowingModel(image: "https://www.pngarts.com/files/3/Smiling-Man-PNG-Image-Background.png",name: "John Doe",state: "Turkey"),
    FollowingModel(image: "https://www.pngarts.com/files/3/Smiling-Man-PNG-Image-Background.png",name: "John Doe",state: "Turkey"),
    FollowingModel(image: "https://www.pngarts.com/files/3/Smiling-Man-PNG-Image-Background.png",name: "John Doe",state: "Turkey"),
    FollowingModel(image: "https://www.pngarts.com/files/3/Smiling-Man-PNG-Image-Background.png",name: "John Doe",state: "Turkey"),
    FollowingModel(image: "https://www.pngarts.com/files/3/Smiling-Man-PNG-Image-Background.png",name: "John Doe",state: "Turkey"),
    FollowingModel(image: "https://www.pngarts.com/files/3/Smiling-Man-PNG-Image-Background.png",name: "John Doe",state: "Turkey"),
    FollowingModel(image: "https://www.pngarts.com/files/3/Smiling-Man-PNG-Image-Background.png",name: "John Doe",state: "Turkey"),
    FollowingModel(image: "https://www.pngarts.com/files/3/Smiling-Man-PNG-Image-Background.png",name: "John Doe",state: "Turkey"),
  ];
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<BlocServices>(context);
    if(bloc.isFollowingSelected.isEmpty){
      bloc.setFollowingList(_list);
    }
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
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(bloc.isSelectedList?.length??0, ((index){
                      return Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left:w*.1,top: screen?h*.04:w*.04),
                            child: CustomCircleWidget(
                              isBorder: true,
                              wdth1: l/10,
                              hght1: l/10,
                              wdth: l/10,
                              hght: l/10,
                              image: bloc.isFollowingSelected[index]?.image,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Padding(
                            padding: EdgeInsets.only(top: screen?h*.04:w*.04),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(bloc.isFollowingSelected[index]?.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: screen?w*.04:h*.04,color: Utils.baseColr),),
                                Text(bloc.isFollowingSelected[index]?.state,style: TextStyle(fontWeight: FontWeight.w400,fontSize: screen?w*.03:h*.03,color: Utils.baseColr),),
                              ],
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(top: screen?h*.04:w*.04,right: 50),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              elevation: 5,
                              child: Container(
                               width: w*.2,
                               height: screen?h*.03:w*.03,
                               decoration: BoxDecoration(
                                 color: bloc.isFollowingSelected[index]?.check ? Utils.baseColr : Colors.transparent,
                                 border: Border.all(color: Utils.baseColr),
                                 borderRadius: BorderRadius.circular(6),
                               ),
                                child: AnimatedCrossFade(
                                  duration: Duration(milliseconds: 200),
                                  crossFadeState: bloc.isFollowingSelected[index]?.check ?
                                  CrossFadeState.showSecond : CrossFadeState.showFirst,
                                  firstChild: InkWell(
                                    onTap: (){
                                      if(bloc.isFollowingSelected[index].check == true){
                                        bloc.selectFollowingList(index, false);
                                      }else{
                                        bloc.selectFollowingList(index, true);
                                      }
                                    },
                                    child: Center(
                                      child: Text(
                                        "Follow",
                                        style: TextStyle(fontSize: screen?w*.03:h*.03,color:Utils.baseColr),
                                      ),
                                    ),
                                  ),
                                  secondChild: InkWell(
                                    onTap: (){
                                      if(bloc.isFollowingSelected[index]?.check == true){
                                        bloc.selectFollowingList(index, false);
                                      }else{
                                        bloc.selectFollowingList(index, true);
                                      }
                                    },
                                    child: Center(
                                      child: Text(
                                         "Unfollow",
                                        style: TextStyle(fontSize: screen?w*.03:h*.03,color:Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    })),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomButton(
                  w1: w*.9,
                  text: 'Next',
                  onPressed: (){
                    Navigator.push(context, Utils.createRoute(page: TravelHistoryInitial()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FollowingModel{
  final String image;
  final String name;
  final String state;
  bool check = false;
  FollowingModel({this.image,this.name,this.state});
}