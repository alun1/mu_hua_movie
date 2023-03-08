import 'package:get/get.dart';
import 'package:hive/hive.dart';

class MyService extends GetxService {
  late Box allBox;
  var selectSourceUrl = "".obs;
  var selectSourceKey = "".obs;


  init() async {
    allBox = await Hive.openBox('allBox');
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
