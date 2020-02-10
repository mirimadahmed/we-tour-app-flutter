import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_app/bloc_pattern/add_photo_bloc.dart';
import 'package:tour_app/utils/repo.dart';
import 'package:tour_app/widgets/custom_button.dart';
import 'package:tour_app/widgets/text_field_widget.dart';


class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AddPhotoBloc>(context);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: screen?h*.06:w*.06,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("New Account",style: TextStyle(color: Utils.baseColr,fontWeight: FontWeight.bold,fontSize: screen?w*.06:h*.06),),
                Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color:Utils.baseColr,width: 4),
                          borderRadius: BorderRadius.circular(200)
                      ),
                      width: l/10,
                      height: l/10,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(200),
                        onTap: bloc.getImageGallery,
                        child:bloc.image == null ?
                            Icon(Icons.camera_alt,color: Colors.black54,)
                            :ClipRRect(
                            borderRadius: BorderRadius.circular(200),
                            child: Image.file(bloc.image,fit: BoxFit.cover,)),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("upload your",style: TextStyle(color: Utils.baseColr,fontWeight: FontWeight.bold,fontSize: screen?w*.03:h*.03),),
                    Text("profile picture",style: TextStyle(color: Utils.baseColr,fontWeight: FontWeight.bold,fontSize: screen?w*.03:h*.03),),
                  ],
                ),
              ],
            ),
            CustomTextFieldWidget(
              labelText: 'Email',
              hintText: 'example@mail.com',
            ),
            SizedBox(height: screen?h*.03:w*.03,),
            CustomTextFieldWidget(
              labelText: 'Username',
              hintText: 'mirimadahmed',
            ),
            SizedBox(height: screen?h*.03:w*.03,),
            CustomTextFieldWidget(
              labelText: 'Password',
              hintText: '********',
            ),
            SizedBox(height: screen?h*.06:w*.06,),
            CustomButton(
              w1: w,
              h2: screen?h*.08:w*.08,
              text: 'Sign Up',
            ),
          ],
        ),
      ),
    );
  }
}
