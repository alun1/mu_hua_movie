import 'dart:io';

import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mu_hua_movie/model/repository/net_versoin_update_repository.dart';
import '../../routes/app_routes.dart';
import '../../service/my_service.dart';
import '../source/source_entity.dart';

class SplashCon extends GetxController {
  @override
  void onReady() {
    init();
  }

  init() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(SourceEntityAdapter());
    }

    await Get.find<MyService>().initBox();
    Get.offAndToNamed(Routes.home);
  }

  updateVersion() async {
    Map<String, dynamic>? updateInfo =
        await Get.find<NetVersionUpdateRepository>().getUpdateInfo();
    if (updateInfo != null) {
      Map<String, dynamic>? platformUpdateInfo;
      if (Platform.isAndroid) {
        platformUpdateInfo = updateInfo["android"];
      }
      if (platformUpdateInfo != null) {
        int versionCode = platformUpdateInfo["versionCode"];
        String versionName = platformUpdateInfo["versionName"];
        int force = platformUpdateInfo["force"];
        String log = platformUpdateInfo["log"];
        String url = platformUpdateInfo["url"];
      }
    }
  }
}