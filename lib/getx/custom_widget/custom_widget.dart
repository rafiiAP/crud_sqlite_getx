import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomWidget {
  //---------------------BOTTOM SHEET---------------------
  static showBottom(
      {Widget? child, EdgeInsetsGeometry? padding, Color? color}) async {
    Get.bottomSheet(
      Container(
        color: color,
        padding: padding,
        child: child,
      ),
      elevation: 5,
      isScrollControlled: true,
    );
  }

  //------------------------CARD----------------------------
  static cardListTile(
      {Color? color,
      EdgeInsetsGeometry? margin,
      Widget? child,
      void Function()? onTap}) {
    return Card(
      color: color,
      margin: margin,
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
