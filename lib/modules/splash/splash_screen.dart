import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mu_hua_movie/modules/splash/splash_con.dart';


class SplashScreen extends GetView<SplashCon> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
            child: Icon(
          Icons.play_arrow,
          color: Colors.white,
          size: 100,
        )));
  }


}
