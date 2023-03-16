import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mu_hua_movie/routes/app_page.dart';
import 'getx_bindings/my_bindings.dart';

Future<void> main() async {
  runApp(const MyApp());
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '源播',
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      initialRoute: AppPages.initial,
      getPages: AppPages.uPages,
      initialBinding: MyBinding(),
    );
  }
}
