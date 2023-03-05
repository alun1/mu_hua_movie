import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mu_hua_movie/routes/app_page.dart';
import 'package:mu_hua_movie/routes/app_routes.dart';
import 'getx_bindings/my_bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      initialRoute: Routes.home,
      getPages: AppPages.uPages,
      initialBinding: MyBinding(),
    );
  }
}


