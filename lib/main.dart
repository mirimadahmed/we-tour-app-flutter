import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_app/screens/auth_page.dart';
import 'package:tour_app/utils/repo.dart';
import 'package:tour_app/widgets/custom_button.dart';
import 'package:tour_app/widgets/information_swipe.dart';

import 'bloc_pattern/add_photo_bloc.dart';
import 'bloc_pattern/bloc_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AddPhotoBloc>.value(value: AddPhotoBloc()),
        ChangeNotifierProvider<BlocServices>.value(value: BlocServices()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: screen?h*.1:w*.1,),
            Text("find friends to travel with",style: TextStyle(color: Utils.baseColr,fontWeight: FontWeight.bold,fontSize: screen?w*.05:h*.05),),
            SizedBox(height: screen?h*.05:w*.05,),
            Container(
                width: w,
                height: screen?h*.6:w*.6,
                child: HeaderSection(
                  data: List.generate(5, ((index){
                    return Container(
                      width: w,
                      color: Utils.baseColr,
                    );
                  })),
                )),
            SizedBox(height: screen?h*.1:w*.1,),
            CustomButton(
              w1: w*.9,
              h2: screen?h*.08:w*.08,
              text: 'Next',
              onPressed: (){
                Navigator.push(context, Utils.createRoute(page: AuthPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

