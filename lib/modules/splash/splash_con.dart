import 'dart:io';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mu_hua_movie/model/repository/net_versoin_update_repository.dart';
import 'package:mu_hua_movie/native_channel/native_channel.dart';
import '../../routes/app_routes.dart';
import '../../service/my_service.dart';
import '../source/source_entity.dart';

class SplashCon extends GetxController {
  var progress = 0.0.obs;

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
    await updateVersion();
    Get.offAndToNamed(Routes.home);
  }

  updateVersion() async {
    Map<String, dynamic>? updateInfo =
        await Get.find<NetVersionUpdateRepository>().getUpdateInfo();
    if (updateInfo != null) {
      Map<String, dynamic>? platformUpdateInfo;

      platformUpdateInfo = updateInfo[Platform.operatingSystem];
      if (platformUpdateInfo != null) {
        int versionCode = platformUpdateInfo["versionCode"];
        String versionName = platformUpdateInfo["versionName"];
        int force = platformUpdateInfo["force"];
        String log = platformUpdateInfo["log"];
        String url = platformUpdateInfo["url"];

        String path = await Get.find<NetVersionUpdateRepository>().downApp(url,
            onDownloadProgress: (int byteCount, int totalBytes) {
          progress.value = byteCount / totalBytes;
        });

        await NativeChannel().installApk(path);
      }
    }
  }
}
