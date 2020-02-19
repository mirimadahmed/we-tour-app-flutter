import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_app/bloc_pattern/bloc_service.dart';
import 'package:tour_app/model/addstop_model.dart';
import 'package:tour_app/utils/repo.dart';
import 'package:tour_app/widgets/custom_button.dart';
import 'package:tour_app/widgets/text_field_widget.dart';
import 'dart:io';

class StopView extends StatefulWidget {
  final File image;
  final int mainIndex;
  final int index;
  final String stopName;
  final String decryption;
  const StopView({Key key, this.image, this.index, this.mainIndex,this.stopName, this.decryption}) : super(key: key);
  @override
  _StopViewState createState() => _StopViewState();
}

class _StopViewState extends State<StopView> {

  TextEditingController _controllerDesc;
  TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controllerDesc = TextEditingController(text: widget.decryption);
    _controller = TextEditingController(text: widget.stopName);
  }
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<BlocServices>(context);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  child: Image.file(widget.image),
                ),
                Padding(
                  padding: EdgeInsets.only(top:screen?h*.04:w*.05, left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.clear,color: Colors.white,),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.white,),
                        onPressed: (){
                          bloc.removerPost(widget.mainIndex,widget.index);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: screen?h*.07:w*.07,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: CustomTextFieldWidget(
                labelText: 'Stop title',
                hintText: '',
                controller: _controller,
              ),
            ),
            SizedBox(height: screen?h*.03:w*.03,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text("Stop description",style: TextStyle(fontSize: screen?w*.04:h*.04,fontWeight: FontWeight.bold,color: Utils.baseColr),),
            ),
            SizedBox(height: screen?h*.04:w*.04,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: CustomTextFieldWidget(
                labelText: '',
                hintText: '',
                controller: _controllerDesc,
              ),
            ),
            SizedBox(height: screen?h*.1:w*.1,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: CustomButton(
                  text: "Update",
                  onPressed: () {
                    bloc.updatePost(
                        widget.mainIndex,
                        widget.index,
                        AddStopModel(
                            image: widget.image,
                            desc: _controllerDesc.text,
                            stop: _controller.text
                        )
                    );
                    Navigator.pop(context);
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
