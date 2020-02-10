import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tour_app/utils/repo.dart';

class AddPhotoBloc extends ChangeNotifier{
  File _image;
  File get image => _image;
  getImageGallery()async{
    Utils().getImage().then((res){
      if(res != null){
        _image = res;
        notifyListeners();
      }
    });
  }

  List<File> _images = [];
  List<File> get images => _images;
  getListImages(){
    print("okay");
    Utils().getImage().then((res){
      if(res != null){
        _images.add(res);
        notifyListeners();
      }
    });
  }

}