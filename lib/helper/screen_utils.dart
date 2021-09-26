import 'package:flutter/material.dart';

class ScreenUtils {

  static late double statusBarHeight;
  static late double totalBodyHeight;
  static late double bodyWidth;
  static late bool isStatusBarBig;

  static void setScreenSizes(BuildContext context){
    statusBarHeight = MediaQuery.of(context).padding.top;
    totalBodyHeight = MediaQuery.of(context).size.height;
    bodyWidth = MediaQuery.of(context).size.width;
    isStatusBarBig = statusBarHeight > 55.0;
  }

  static getDesignWidth(double designMargin){
    return (designMargin / 375) * bodyWidth ;
  }

  static getDesignHeight(double designMargin){
    return (designMargin / 812) * totalBodyHeight;
  }
}