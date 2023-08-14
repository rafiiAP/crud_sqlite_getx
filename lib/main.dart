// import 'package:crud_sqlite/tanpa_statemanagement/presentation/page/home_page.dart';
import 'package:crud_sqlite/tanpa_statemanagement/style/main_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'getx/presentation/page/home_page_get.dart';

void main() {
  initializeDateFormatting('id_ID', null).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CRUD SQL',
      theme: MainStyle.light,
      darkTheme: MainStyle.dark,
      themeMode: ThemeMode.system,
      home: const HomePageGet(),
    );
  }
}
