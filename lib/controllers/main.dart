import 'package:ecommerce_app/ui/widgets/main.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class NavigationC extends GetxController {

  int currentIdx = 0;

  final widgets = <Widget>[const HomeW(), StoreW(), WishListW(), ProfileW()];

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