import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mu_hua_movie/routes/app_page.dart';
import 'package:talkingdata_sdk_plugin/talkingdata_sdk_plugin.dart';
import 'getx_bindings/my_bindings.dart';

Future<void> main() async {
  TalkingDataSDK.init(
      appID: "94AEA0CDD9F647C0BDE6F022B8D2583C",
      channelID: Platform.operatingSystem,
      custom: "");
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
