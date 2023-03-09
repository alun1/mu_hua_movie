import 'package:get/get.dart';
import 'package:mu_hua_movie/model/repository/net_repository.dart';
import 'package:mu_hua_movie/service/my_service.dart';

import '../../model/entity/vd_class.dart';
import '../../model/entity/vod_info_entity.dart';

class HomeCon extends GetxController {
  RxList<VodInfoEntity> vodInfo = RxList();
  RxList<VdClass> vdClass = RxList();
  int page = 1;
  int pageC = 0;
  var keyword = "".obs;
  var isShowSearch = false.obs;

  Rx<int?> categoryId = Rx(null);

  @override
  void onInit() {
    getCategory();
    getIndex();

    Get.find<MyService>().selectSourceUrl.listen((p0) {
      categoryId.value = null;
      page = 1;
      getCategory();
      getIndex(url: p0);
    });

    super.onInit();
  }

  getIndex({String? url}) async {
    try {
      var req = await Get.find<NetRepository>().getIndex(
          url: url,
          page: page,
          keyword: keyword.value,
          category: categoryId.value);
      if (page == 1) {
        vodInfo.clear();
      }
      vodInfo.addAll(req?.list ?? []);
      pageC = req?.pagecount ?? 0;
      page++;
    } catch (e) {
      e.printError();
    }
  }

  getCategory() async {
    try {
      vdClass.clear();
      var req = await Get.find<NetRepository>().getIndex(isList: true);
      vdClass.addAll(req?.xClass ?? []);
    } catch (e) {
      e.printError();
    }
  }
}
