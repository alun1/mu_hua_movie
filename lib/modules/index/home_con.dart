import 'package:get/get.dart';
import 'package:mu_hua_movie/model/repository/net_repository.dart';

import '../../model/entity/vod_info_entity.dart';



class HomeCon extends GetxController {
  RxList<VodInfoEntity> vodInfo = RxList();
  int page = 1;
  int pageC = 0;
  var keyword = "".obs;
  var isShowSearch = false.obs;

 @override
  onReady(){
   Future.delayed(const Duration(seconds: 1)).then((value) {
     getIndex();
   });

 }

  getIndex() async {
    try {
      var req =
          await Get.find<NetRepository>().getIndex(page, keyword: keyword.value);
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
}
