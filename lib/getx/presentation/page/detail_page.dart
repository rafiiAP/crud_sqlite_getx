import 'package:crud_sqlite/getx/presentation/statemanagement/detail_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPageGet extends StatelessWidget {
  final String? title;
  final String? description;
  final String? time;
  final int? index;

  const DetailPageGet(
      {super.key, this.title, this.description, this.time = '', this.index});

  @override
  Widget build(BuildContext context) {
    var ctrl = Get.put(DetailGetx(cDescription: description, cTitle: title));

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.chevron_left_rounded,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bookmark_border,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/tes.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.all(11),
                    child: ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              style: Get.textTheme.titleLarge!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              controller: ctrl.ctrlTitle,
                              decoration: const InputDecoration(
                                hintText: 'Masukkan catatan',
                                border: InputBorder.none,
                              ),
                              maxLines: null,
                              onChanged: (value) {
                                ctrl.updateItem(index!);
                              },
                            ),
                            Text(
                              time!,
                              style: Get.textTheme.bodyLarge!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.white,
                        ),
                        // const SizedBox(
                        //   height: 25,
                        // ),
                        TextField(
                          maxLines: null,
                          focusNode: FocusNode(),
                          style: Get.textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                            // fontWeight: FontWeight.bold,
                          ),
                          controller: ctrl.ctrlDescription,
                          decoration: const InputDecoration(
                            hintText: 'Masukkan catatan',
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            ctrl.updateItem(index!);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 71, 71, 71),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.chevron_left_rounded,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.bookmark_border,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
