// ignore_for_file: avoid_print

import 'package:crud_sqlite/getx/custom_widget/custom_widget.dart';
import 'package:crud_sqlite/getx/model/note_entity.dart';
import 'package:crud_sqlite/getx/presentation/page/detail_page.dart';
import 'package:crud_sqlite/getx/presentation/statemanagement/home_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageGet extends StatelessWidget {
  const HomePageGet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeGetx ctrl = Get.put(HomeGetx());
    ctrl.refreshJournals();
    return Scaffold(
      appBar: AppBar(
        title: const Text('EHE'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ctrl.showBottomSheet(null);
        },
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/tes.jpeg'), // Ubah "nama_gambar.png" dengan nama gambar yang sesuai
            fit: BoxFit.cover,
          ),
        ),
        child: Obx(
          () => RefreshIndicator(
            onRefresh: () async {
              ctrl.refreshJournals();
            },
            child: ctrl.lLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView.builder(
                      itemCount: ctrl.vaJournals.length,
                      itemBuilder: (context, index) {
                        NoteEntity noteEntity = ctrl.vaJournals[index];
                        return CustomWidget.cardListTile(
                          onTap: () {
                            Get.to(
                              DetailPageGet(
                                title: noteEntity.cTitle,
                                description: noteEntity.cDescription,
                                time: noteEntity.cCreatedAt,
                                index: noteEntity.id,
                              ),
                            )!
                                .then((value) => ctrl.refreshJournals());
                          },
                          color: Colors.deepPurple,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                              title: Text(
                                noteEntity.cTitle.toString().toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    noteEntity.cDescription,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    noteEntity.cCreatedAt,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: SizedBox(
                                width: 100,
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                      onPressed: () =>
                                          ctrl.showBottomSheet(noteEntity.id),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                      onPressed: () =>
                                          ctrl.deleteItem(noteEntity.id),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
