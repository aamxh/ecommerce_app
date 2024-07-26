import 'package:ecommerce_app/config/popular_categories.dart';
import 'package:ecommerce_app/ui/widgets/main.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class NavigationC extends GetxController {

  int currentIdx = 0;

  final widgets = const <Widget>[HomeW(), StoreW(), WishListW(), ProfileW()];

  void updateIdx(int idx) {
    currentIdx = idx;
    update();
  }

}

class CarouselSliderC extends GetxController {
  
  int idx = 0;
  
  void updateIdx(int newIdx) {
    idx = newIdx;
    update();
  }
  
}

class TabBarC extends GetxController {
  
  int idx = 0;

  void changeIdx(int newIdx) {
    idx = newIdx;
    update();
  }

  final categories = <Widget>[
    Container(color: Colors.white,),
    Container(color: Colors.black,),
    Container(color: Colors.grey,),
    Container(color: Colors.amber,),
    Container(color: Colors.purple,),
    Container(color: Colors.pink,),
  ];
  
}