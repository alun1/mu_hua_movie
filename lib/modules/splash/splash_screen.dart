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

    return const Material(child: Center(child: Text("源播")));
  }

  init() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(SourceEntityAdapter());
    }

    final myService = MyService();
    await myService.init();
    Get.put(myService);

    Future.delayed(const Duration(seconds: 2)).then((value) {
      Get.offAndToNamed(Routes.home);
    });
  }
}
