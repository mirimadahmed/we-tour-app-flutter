import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_app/bloc_pattern/add_photo_bloc.dart';
import 'package:tour_app/bloc_pattern/bloc_service.dart';
import 'package:tour_app/model/addstop_model.dart';
import 'package:tour_app/utils/repo.dart';
import 'package:tour_app/widgets/custom_button.dart';
import 'package:tour_app/widgets/dotted_border.dart';
import 'package:tour_app/widgets/text_field_widget.dart';

class AddStopPage extends StatefulWidget {
  final int index;
  AddStopPage({Key key, this.index}) : super(key: key);

  @override
  _AddStopPageState createState() => _AddStopPageState();
}

class _AddStopPageState extends State<AddStopPage> {

  TextEditingController _controllerDesc;
  TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controllerDesc = TextEditingController();
    _controller = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    final blocPhoto = Provider.of<AddPhotoBloc>(context);
    final bloc = Provider.of<BlocServices>(context);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Utils.baseColr,
        title: Text("Add new stop",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        leading: IconButton(
          icon: Icon(Icons.clear,color: Colors.white,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: screen?h*.07:w*.07,),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: screen?w*.09:h*.09,bottom: screen?h*.02:w*.02),
                  child: DottedBorder(
                    color: Utils.baseColr,
                    strokeWidth: 1,
                    dashPattern: [8, 4],
                    strokeCap: StrokeCap.butt,
                    child: Container(
                      width: l/6,
                      height: l/6,
                      child: InkWell(
                        child: blocPhoto.image == null ? Center(
                          child:
                          Icon(Icons.camera_alt,color: Colors.black54,size: screen ? w*.1:h*.1,)
                        ) : FittedBox(
                            fit: BoxFit.cover,
                            child: Image.file(blocPhoto.image,fit: BoxFit.fitHeight,)),
                        onTap: () {
                          blocPhoto.getImageGallery();
                        } ,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: screen?h*.09:w*.09),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: screen?w*.1:h*.1),
                        child: Text("Add a picture",style: TextStyle(fontSize: screen?w*.05:h*.05,color: Utils.baseColr, fontWeight: FontWeight.w400),),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Image.asset("images/arrow.png"),
                      )
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
                text: "Add",
                onPressed: () {
                  bloc.setAddstopData(
                      widget.index,
                      AddStopModel(
                        image: blocPhoto.image,
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
