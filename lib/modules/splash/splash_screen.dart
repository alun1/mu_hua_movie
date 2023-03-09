import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import '../../routes/app_routes.dart';
import '../../service/my_service.dart';
import '../source/source_entity.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    init();
    return const Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
            child: Icon(
          Icons.play_arrow,
          color: Colors.white,
          size: 100,
        )));
  }

  init() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(SourceEntityAdapter());
    }

    await Get.find<MyService>().init();
    Get.offAndToNamed(Routes.home);
  }
}
