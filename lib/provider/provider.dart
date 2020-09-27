import 'package:flutter/material.dart';

class MyProvider with ChangeNotifier{
  int count = 0;
  getCount1()=>count ;
  incrementCount(){
    count++ ;
    notifyListeners();
  }

  getCount2()=>count2 ;
  int count2 = 0;
  incrementCount2(){
    count2++ ;
    notifyListeners();
  }

  DateTime myDateTime = DateTime.now();


}