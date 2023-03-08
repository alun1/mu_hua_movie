import 'package:get/get.dart';
import 'package:mu_hua_movie/model/repository/net_repository.dart';

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

    super.onInit();
  }

  getIndex() async {
    try {
      var req = await Get.find<NetRepository>()
          .getIndex(page: page, keyword: keyword.value,category: categoryId.value);
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
