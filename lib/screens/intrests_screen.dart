import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_app/bloc_pattern/bloc_service.dart';
import 'package:tour_app/utils/repo.dart';
import 'package:tour_app/widgets/custom_button.dart';
import 'package:transparent_image/transparent_image.dart';

import 'followinitial.dart';

class IntrestPage extends StatelessWidget {
  List<IntrestModel> _list = [
    IntrestModel(image: "https://magoo-app.s3.amazonaws.com/we-tour/183223496.jpg",title: "Hunza"),
    IntrestModel(image: "https://magoo-app.s3.amazonaws.com/we-tour/183223496.jpg",title: "Hunza"),
    IntrestModel(image: "https://magoo-app.s3.amazonaws.com/we-tour/183223496.jpg",title: "Hunza"),
    IntrestModel(image: "https://magoo-app.s3.amazonaws.com/we-tour/183223496.jpg",title: "Hunza"),
    IntrestModel(image: "https://magoo-app.s3.amazonaws.com/we-tour/183223496.jpg",title: "Hunza"),
    IntrestModel(image: "https://magoo-app.s3.amazonaws.com/we-tour/183223496.jpg",title: "Hunza"),
    IntrestModel(image: "https://magoo-app.s3.amazonaws.com/we-tour/183223496.jpg",title: "Hunza"),
    IntrestModel(image: "https://magoo-app.s3.amazonaws.com/we-tour/183223496.jpg",title: "Hunza"),
    IntrestModel(image: "https://magoo-app.s3.amazonaws.com/we-tour/183223496.jpg",title: "Hunza"),
    IntrestModel(image: "https://magoo-app.s3.amazonaws.com/we-tour/183223496.jpg",title: "Hunza"),
  ];
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<BlocServices>(context);
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
                      itemCount: _list.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: screen ?2:3
                      ),
                      itemBuilder: (context, index){
                        if(bloc.isSelectedList.isEmpty){
                          bloc.setTaskList(_list);
                        }
                        return Container(
                          padding: EdgeInsets.all(10),
                          child: Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  width: w,
                                  height: h,
                                  color: Colors.grey.withOpacity(0.2),
                                  child: FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: _list[index].image,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 10,
                                bottom: 10,
                                child: Text(_list[index].title ??"",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              ),
                              Positioned(
                                right: 10,
                                bottom: 10,
                                child: InkWell(
                                  onTap: (){
                                    if(bloc.isSelectedList[index].check == false){
                                      bloc.selectedTask(index,true);
                                    }else{
                                      bloc.selectedTask(index,false);
                                    }
                                  },
                                  child: Container(
                                    width: l/30,
                                    height: l/30,
                                    decoration: BoxDecoration(
                                      color:bloc.isSelectedList[index].check ? Utils.baseColr:Colors.transparent,
                                      border: Border.all(color:bloc.isSelectedList[index].check ? Utils.baseColr: Colors.white,width: 2),
                                      borderRadius: BorderRadius.circular(100)
                                    ),
                                    child: Center(
                                      child: Icon(Icons.check,color: bloc.isSelectedList[index].check ? Colors.white : Colors.transparent,size: screen ? w*.04:h*.04,),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
//                    Positioned(
//                      bottom: 20,
//                      left: 20,
//                      right: 20,
//                      child: CustomButton(
//                        w1: w,
//                        h2: screen?h*.08:w*.08,
//                        text: 'Next',
//                        onPressed: (){
//                          Navigator.push(context, Utils.createRoute(page: FollowInitial()));
//                        },
//                      ),
//                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomButton(
                  w1: w*.9,
                  text: 'Next',
                  onPressed: (){
                    Navigator.push(context, Utils.createRoute(page: FollowInitial()));
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

class IntrestModel{
  final String image;
  bool check = false;
  final String title;
  IntrestModel({this.image,this.title});
}