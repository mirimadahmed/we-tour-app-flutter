import 'package:flutter/material.dart';
import 'package:tour_app/screens/profile_page.dart';
import 'package:tour_app/utils/repo.dart';

import 'chats_usres.dart';
import 'home_page.dart';
import 'my_trips.dart';

class BottomFittnessPage extends StatefulWidget {
  @override
  _BottomFittnessPageState createState() => _BottomFittnessPageState();
}

class _BottomFittnessPageState extends State<BottomFittnessPage> with SingleTickerProviderStateMixin {
  TabController tabsController;
  int index = 0;
  @override
  void initState() {
    super.initState();
    tabsController = new TabController(length: 4, vsync: this);
    tabsController.addListener((){
      setState(() {
        index = tabsController.index;
      });
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabsController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Orientation orien = MediaQuery.of(context).orientation;
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    bool screen = orien == Orientation.portrait ? true:false;
    return Scaffold(
      body: TabBarView(
        controller: tabsController,
        children: <Widget>[
          HomePage(),
          MyTrips(),
          ChatUsers(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: Container(
        height: screen?h*.08:w*.08,
        child: Material(
          color: Utils.baseColr,
          child: TabBar(
            indicatorColor: Colors.transparent,
            controller: tabsController,
            tabs: <Widget>[
              Tab(
                child: Icon(Icons.home),
              ),
              Tab(
                child: Icon(Icons.location_city),
              ),
              Tab(
                child: Icon(Icons.message),
              ),
              Tab(
                child: Icon(Icons.person),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
