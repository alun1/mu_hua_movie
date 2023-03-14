import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mu_hua_movie/model/entity/update_info_entity.dart';
import 'package:mu_hua_movie/model/repository/net_versoin_update_repository.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:mu_hua_movie/native_channel/native_channel.dart';
import '../../routes/app_routes.dart';
import '../../service/my_service.dart';
import '../source/source_entity.dart';

class SplashCon extends GetxController {
  var progress = 0.0.obs;

  UpdateInfoEntity? updateInfo;
  String version = "";
  String buildNumber = "";

  @override
  void onReady() {
    init();
  }

  init() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(SourceEntityAdapter());
    }
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    buildNumber= packageInfo.buildNumber;
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
        var updateInfo = UpdateInfoEntity.fromJson(platformUpdateInfo);

        if (int.parse(buildNumber) < updateInfo.versionCode) {
          Get.defaultDialog(
              title: "更新",
              content: Text(updateInfo.log),
              confirm: ElevatedButton(
                  onPressed: () async {
                    Get.back();

                    String path = await Get.find<NetVersionUpdateRepository>()
                        .downApp(updateInfo.url, onDownloadProgress:
                            (int byteCount, int totalBytes) {
                      progress.value = byteCount / totalBytes;
                    });

                    await NativeChannel().installApk(path);
                  },
                  child: const Text("确定")),
              cancel: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("取消")));
        }
      }
    }
  }
}
