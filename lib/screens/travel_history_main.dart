import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_app/bloc_pattern/add_photo_bloc.dart';
import 'package:tour_app/bloc_pattern/bloc_service.dart';
import 'package:tour_app/utils/repo.dart';
import 'package:tour_app/widgets/dotted_border.dart';

import 'add_stop.dart';

class TravelHistoryMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<BlocServices>(context);
    final blocPhoto = Provider.of<AddPhotoBloc>(context);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Utils.baseColr,
        title: Text("${bloc.numberOfDays ?? ""} day wandering in hunza",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20,),
              Text("Memories",style: TextStyle(fontSize: screen?w*.05:h*.05,fontWeight: FontWeight.bold,color: Color.fromRGBO(17, 141, 150, 1.0)),),
              SizedBox(height: 20,),
              Row(
                children: <Widget>[
                  DottedBorder(
                    color: Colors.black,
                    strokeWidth: 1,
                    dashPattern: [8, 4],
                    strokeCap: StrokeCap.butt,
                    child: Container(
                      width: l/6,
                      height: l/6,
                      child: InkWell(
                        child: Center(
                          child: Icon(Icons.camera_alt,color: Colors.black54,size: screen ? w*.1:h*.1,),
                        ),
                        onTap: () {
                          print("ok");
                          blocPhoto.getListImages();
                        } ,
                      ),
                    ),
                  ),
                  SizedBox(width: 4,),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: blocPhoto.images.isNotEmpty ? Row(
                        children: List.generate(blocPhoto.images.length, ((index){
                          return Card(
                            elevation: 5,
                            child: Container(
                              width: l/6,
                              height: l/6,
                              decoration: BoxDecoration(
                                  color: Utils.baseColr,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 20.0, // soften the shadow
                                      spreadRadius: 0.0, //extend the shadow
                                      offset: Offset(
                                        1.0, // Move to right 10  horizontally
                                        5.0, // Move to bottom 10 Vertically
                                      ),
                                    ),
                                  ]
                              ),
                              child: Image.file(blocPhoto.images[index],fit: BoxFit.fill,),
                            ),
                          );
                        })),
                      ) : Container(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screen ? h*.07:w*.07,),
              Padding(
                padding: EdgeInsets.only(left: l/70),
                child: Text("Day",style: TextStyle(fontSize: screen?w*.04:h*.04,fontWeight: FontWeight.bold,color: Utils.baseColr),),
              ),
              SizedBox(height: screen ? h*.02:w*.02,),
              bloc.numberOfDays != null ?Column(
                children:List.generate(bloc.numberOfDays, ((index){
                  return Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            width: l/15,
                            height: l/15,
                            decoration: BoxDecoration(
                              color: Utils.baseColr,
                              borderRadius: BorderRadius.circular(100)
                            ),
                            child: Center(
                              child: Text("${index+1}",style: TextStyle(color: Colors.white),),
                            ),
                          ),
                          DottedBorder(
                            color: Colors.black,
                            strokeWidth: 1,
                            dashPattern: [8, 4],
                            strokeCap: StrokeCap.butt,
                            child: Container(
                              width: 0,
                              height: screen ? h*.09:w*.09,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10,),
                      Padding(
                        padding: EdgeInsets.only(bottom: screen?h*.08:w*.08),
                        child: DottedBorder(
                          color: Colors.black,
                          strokeWidth: 1,
                          dashPattern: [8, 4],
                          strokeCap: StrokeCap.butt,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 2),
                            height: screen ? h*.06:w*.06,
                            color: Utils.baseColr,
                            child: InkWell(
                              child: Center(
                                child: Text("Add new photo",style: TextStyle(color: Colors.white),),
                              ),
                              onTap: (){
                                Navigator.push(context, Utils.createRoute(page: AddStopPage()));
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                })),
              ) : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
