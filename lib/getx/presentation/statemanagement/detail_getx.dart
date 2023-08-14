import 'package:crud_sqlite/getx/function/sql_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailGetx extends GetxController {
  DetailGetx({this.cDescription, this.cTitle});
  String? cDescription;
  String? cTitle;

  TextEditingController ctrlDescription = TextEditingController();
  TextEditingController ctrlTitle = TextEditingController();

  Future updateItem(int id) async {
    await SQLHelper.updateItem(id, ctrlTitle.text, ctrlDescription.text);
  }

  @override
  void onInit() {
    ctrlDescription.text = cDescription!;
    ctrlTitle.text = cTitle!;

    super.onInit();
  }
}
