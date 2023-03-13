import 'package:get/get.dart';

import '../model/repository/net_repository.dart';
import '../model/repository/net_versoin_update_repository.dart';
import '../service/my_service.dart';

class MyBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.put(NetRepository(), permanent: true);

    final myService = MyService();
    Get.put(myService, permanent: true);
    Get.put(NetVersionUpdateRepository(), permanent: true);
  }
}
