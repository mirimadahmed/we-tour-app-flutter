import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tour_app/model/addstop_model.dart';
import 'package:tour_app/screens/followinitial.dart';
import 'package:tour_app/screens/intrests_screen.dart';
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
        numberOfDays = int.parse(res.toString().split(',').toList()[1].toString().split(' ').toList()[1])  - int.parse(datefrom.toString().split(',').toList()[1].toString().split(' ').toList()[1]) + 1;
        notifyListeners();
        setAddPostLength(numberOfDays);
      }
    });
  }


  /// for intrest screen
  List<IntrestModel> isSelectedList = [];
  selectedTask(index,val){
    isSelectedList[index].check = val;
    notifyListeners();
  }

  setTaskList(list){
    isSelectedList = list;
  }


  /// for Following screen
  List<FollowingModel> isFollowingSelected = [];
  selectFollowingList(index, val){
    isFollowingSelected[index].check = val;
    notifyListeners();
  }
  setFollowingList(list){
    isFollowingSelected = list;
  }


  /// for add post screen

  setAddPostLength(int l){
    List<List<AddStopModel>> _listAddPostBloc = List<List<AddStopModel>>();
    if(listAddPostBloc == null || listAddPostBloc.isEmpty){
      int i = 0;
      while(i < l){
        _listAddPostBloc.add(<AddStopModel>[]);
        i++;
      }
      listAddPostBloc = _listAddPostBloc;
      notifyListeners();
    }else{
      int newEntriesLength = 0;
      if(l > listAddPostBloc.length){
        newEntriesLength = l - listAddPostBloc.length;
        int i = 0;
        while(i < newEntriesLength){
          _listAddPostBloc.add(<AddStopModel>[]);
          i++;
        }
        listAddPostBloc.addAll(_listAddPostBloc);
        notifyListeners();
      }else{
        newEntriesLength = listAddPostBloc.length - l;
        int i = 0;
        while(i < newEntriesLength){
          _listAddPostBloc.add(<AddStopModel>[]);
          i++;
        }
        listAddPostBloc.addAll(_listAddPostBloc);
        notifyListeners();
      }
    }
  }

  List<List<AddStopModel>> listAddPostBloc;

  void setAddstopData(mainIndex,data){
    listAddPostBloc[mainIndex].add(data);
    notifyListeners();
  }

  void updatePost(mainIndex,index,data){
    listAddPostBloc[mainIndex][index] = data;
    notifyListeners();
  }

  removerPost(mainIndex,index){
    listAddPostBloc[mainIndex].removeAt(index);
    notifyListeners();
  }
}

