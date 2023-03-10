import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../modules/source/source_entity.dart';

class MyService extends GetxService {
  late Box allBox;
  var selectSourceUrl = "".obs;
  var selectSourceKey = "".obs;

  // @override
  // onInit() {
  //   super.onInit();
  // }

  initBox() async {
    allBox = await Hive.openBox('allBox');

    final isFirstRun = allBox.get("isFirstRun", defaultValue: true);
    if (isFirstRun) {
      final sourceBox = await Hive.openBox<SourceEntity>('source');

      sourceBox.put(
          "卧龙资源",
          SourceEntity(
              "卧龙资源", "https://collect.wolongzyw.com/api.php/provide/vod/"));

      sourceBox.put(
          "百度云资源",
          SourceEntity(
              "百度云资源", "https://api.apibdzy.com/api.php/provide/vod/"));
      sourceBox.put(
          "天空资源",
          SourceEntity(
              "天空资源", "https://api.tiankongapi.com/api.php/provide/vod/"));

      sourceBox.put("淘片",
          SourceEntity("淘片", "https://sdzyapi.com/api.php/provide/vod/"));

      allBox.put("selectSourceUrl",
          "https://collect.wolongzyw.com/api.php/provide/vod/");
      allBox.put("selectSourceKey", "卧龙资源");
      //
      // sourceBox.put("老鸭",
      //     SourceEntity("老鸭", "https://api.apilyzy.com/api.php/provide/vod/"));



      allBox.put("isFirstRun", false);
    }

    selectSourceUrl.value = allBox.get("selectSourceUrl", defaultValue: "");
    selectSourceKey.value = allBox.get("selectSourceKey", defaultValue: "");
  }

  changeSelectSource(key, url) {
    selectSourceUrl.value = url;
    selectSourceKey.value = key;
    allBox.put("selectSourceKey", key);
    allBox.put("selectSourceUrl", url);
  }
}
