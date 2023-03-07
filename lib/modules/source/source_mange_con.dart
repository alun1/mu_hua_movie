import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mu_hua_movie/modules/source/source_entity.dart';

class SourceMangeCon extends GetxController {
  String addName = "";
  String addUrl = "";

  var count = 0.obs;

  late Box<SourceEntity> sourceBox;

  var selectKey = "".obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    sourceBox = await Hive.openBox<SourceEntity>('source');
    count.value = sourceBox.length;

    selectKey.value =
        Get.find<Box>(tag: "allBox").get("selectSourceKey", defaultValue: "");
  }

  addSource() {
    // if (sourceBox.containsKey(addName)) {
    //   Get.snackbar("提示", "标题重复了，换一个吧");
    //   return;
    // }

    sourceBox
        .put(addName, SourceEntity(addName, addUrl, true))
        .then((value) => count.value = sourceBox.length);
    Get.back();
  }

  @override
  void onClose() {
    sourceBox.close();
    super.onClose();
  }

  changeSelectSource(key) {
    Get.find<Box>(tag: "allBox").put("selectSourceKey", key);
  }
}
