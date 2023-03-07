import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../model/repository/net_repository.dart';

class MyBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.put(NetRepository(), permanent: true);

    var allBox = await Hive.openBox('allBox');
    Get.put(allBox, permanent: true, tag: "allBox");
  }
}
