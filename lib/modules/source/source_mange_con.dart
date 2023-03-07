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
    final addSourceEntity = SourceEntity(addName, addUrl, true);
    sourceBox.put(addName, addSourceEntity).then((value) {
      if (count.value == sourceBox.length) {
        count.refresh();
      } else {
        count.value = sourceBox.length;
      }
    });

    if (selectKey.value.isEmpty) {
      selectKey.value = addName;
      changeSelectSource(addSourceEntity);
    }
    Get.back();
  }

  deleteSource(key) {
    sourceBox.delete(key).then((value) {
      if (count.value == sourceBox.length) {
        count.refresh();
      } else {
        count.value = sourceBox.length;
      }
    });
  }

  @override
  void onClose() {
    sourceBox.close();
    super.onClose();
  }

  changeSelectSource(SourceEntity source) {
    Get.find<Box>(tag: "allBox").put("selectSourceKey", source.name);
    Get.find<Box>(tag: "allBox").put("selectSourceUrl", source.url);
  }
}
