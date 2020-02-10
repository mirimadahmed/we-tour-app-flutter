import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tour_app/utils/repo.dart';


class BlocServices extends ChangeNotifier{


  bool perday = false;
  void perDayChec(bool val){
    perday = val;
    notifyListeners();
  }


  String datefrom;
  String dateTo;
  int numberOfDays;
  void dateFromCheck(context)async{
    Utils().slelectedDate(context).then((res){
      if(res != null){
        datefrom = res;
        notifyListeners();
      }
    });
  }

  void dateToCheck(context){
    Utils().slelectedDate(context).then((res){
      if(res != null){
        dateTo = res;
        numberOfDays = int.parse(res.toString().split(',').toList()[1].toString().split(' ').toList()[1])  - int.parse(datefrom.toString().split(',').toList()[1].toString().split(' ').toList()[1]);
        notifyListeners();
      }
    });
  }



}

