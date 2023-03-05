import 'package:get/get.dart';

import '../model/repository/net_repository.dart';


class MyBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.put(NetRepository(), permanent: true);
  }
}
