// ignore_for_file: avoid_print

import 'package:crud_sqlite/getx/custom_widget/custom_widget.dart';
import 'package:crud_sqlite/getx/function/sql_helper.dart';
import 'package:crud_sqlite/getx/model/note_entity.dart';
import 'package:crud_sqlite/getx/model/note_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeGetx extends GetxController {
  RxList<NoteEntity> vaJournals = <NoteEntity>[].obs;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  var lLoading = true.obs;

  @override
  void onInit() {
    refreshJournals();
    super.onInit();
  }

  // This function is used to fetch all data from the database
  refreshJournals() async {
    final List<Map<String, dynamic>> vaData = await SQLHelper.getItems();
    vaJournals.value =
        vaData.map((e) => NoteModel.fromJson(e).toEntity()).toList();
    lLoading.value = false;

    print('---$vaJournals');
  }

  // Insert a new journal to the database
  Future addItem() async {
    await SQLHelper.createItem(
      title: titleController.text,
      description: descriptionController.text,
    );
    refreshJournals();
  }

  // Update an existing journal
  Future updateItem(int id) async {
    await SQLHelper.updateItem(
        id, titleController.text, descriptionController.text);
    refreshJournals();
  }

  showSnackbar() {
    var snackbar = Get.snackbar('title', 'Successfully deleted a journal!');

    return snackbar;
  }

  // Delete an item
  void deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    showSnackbar();
    refreshJournals();
  }

  showBottomSheet(int? id) {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingJournal =
          vaJournals.firstWhere((element) => element.id == id);
      titleController.text = existingJournal.cTitle;
      descriptionController.text = existingJournal.cDescription;
    } else {
      titleController.text = '';
      descriptionController.text = '';
    }
    CustomWidget.showBottom(
      color: Colors.white,
      padding: EdgeInsets.only(
        top: 15,
        left: 15,
        right: 15,
        // this will prevent the soft keyboard from covering the text fields
        bottom: Get.mediaQuery.viewInsets.bottom + 120,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: titleController,
            maxLines: null,
            decoration: const InputDecoration(hintText: 'Title'),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: descriptionController,
            maxLines: null,
            decoration: const InputDecoration(
              hintText: 'Description',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              // Save new journal
              if (id == null) {
                await addItem();
              } else {
                await updateItem(id);
              }

              Get.back();
            },
            child: Text(id == null ? 'Create New' : 'Update'),
          )
        ],
      ),
    );
  }
}
