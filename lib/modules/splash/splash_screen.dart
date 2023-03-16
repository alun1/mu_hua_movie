import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mu_hua_movie/modules/splash/splash_con.dart';

class SplashScreen extends GetView<SplashCon> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 100,
              ),
              Obx(
                () => Visibility(
                    visible: controller.progress.value > 0,
                    child: LinearProgressIndicator(
                        value: controller.progress.value)),
              )
            ],
          ),
        ));
  }
}
