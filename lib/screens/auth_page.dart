import 'package:flutter/material.dart';
import 'package:tour_app/utils/repo.dart';

import 'auth/sign_in.dart';
import 'auth/signup_page.dart';


class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with SingleTickerProviderStateMixin{
  TabController tabsController;
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabsController = new TabController(length: 2, vsync: this);
    tabsController.addListener((){
      setState(() {
        index = tabsController.index;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    print(index);
    return Scaffold(
      backgroundColor: Utils.baseColr,
      body: Column(
        children: <Widget>[
          Container(
            color: Utils.baseColr,
            width: w,
            height: screen?h*.2+h*.05:w*.2+w*.05,
            child: Padding(
              padding: EdgeInsets.only(top: screen?h*.1+w*.04:w*.1+h*.04,left: screen?w*.2:h*.2),
              child: Text("WT",style: TextStyle(color: Color.fromRGBO(255, 182, 119, 1.0),fontWeight: FontWeight.bold,fontSize: screen?w*.09:h*.09),),
            ),
          ),
          Container(
            color: Utils.baseColr,
            width: w,
            child: TabBar(
              indicatorColor: Colors.white,
              controller: tabsController,
              tabs: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Center(child: Text("Sing In",style: TextStyle(fontWeight: FontWeight.bold,fontSize: screen?w*.06:h*.06),),),
                ),
                Container(
                  child: Center(child: Text("Sgn Up",style: TextStyle(fontWeight: FontWeight.bold,fontSize: screen?w*.06:h*.06),),),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: w,
              child: TabBarView(
                controller: tabsController,
                children: <Widget>[
                  SingInPage(),
                  SignUpPage(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
