import 'package:flutter/material.dart';
import 'package:tour_app/utils/repo.dart';
import 'package:tour_app/widgets/custom_button.dart';
import 'package:tour_app/widgets/text_field_widget.dart';

import '../intrests_screen.dart';


class SingInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: screen?h*.09:w*.09,),
            Text("Welcome back, login to continue",style: TextStyle(color: Utils.baseColr,fontWeight: FontWeight.w400,fontSize: screen?w*.04:h*.04),),
            SizedBox(height: screen?h*.02:w*.02,),
            CustomTextFieldWidget(
              labelText: 'Email',
              hintText: 'example@mail.com',
            ),
            SizedBox(height: screen?h*.05:w*.05,),
            CustomTextFieldWidget(
              labelText: 'Password',
              hintText: '********',
            ),
            SizedBox(height: screen?h*.2:w*.2,),
            CustomButton(
              w1: w*.9,
              h2: screen?h*.08:w*.08,
              text: 'Sing In',
              onPressed: (){
                Navigator.push(context, Utils.createRoute(page: IntrestPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
