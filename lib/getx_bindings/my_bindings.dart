import 'package:get/get.dart';

import '../model/repository/net_repository.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NetRepository(), permanent: true);
  }
}
