import 'package:extended_betterplayer/better_player.dart';
import 'package:get/get.dart';
import 'package:mu_hua_movie/model/entity/vod_info_entity.dart';

import 'my_better_player_data_source.dart';

class PlayerCon extends GetxController {
  late VodInfoEntity arguments;
  late RxList<List<MyBetterPlayerDataSource>> vodPlayUrlEntityList = RxList();

  late List<String> vodPlayFromList;
  var currentPlayFromIndex = 0.obs;

  var currentDataSourceIndex=0.obs;

  @override
  void onInit() {
    super.onInit();
    arguments = Get.arguments;

    vodPlayFromList = arguments.vodPlayFrom.split('\$\$\$');
    String vodPlayUrlStr = arguments.vodPlayUrl;
    analysisUrl(vodPlayUrlStr);
  }

  analysisUrl(String vodPlayUrlStr) {
    var vodPlayUrlTypeArray = vodPlayUrlStr.split('\$\$\$');

    vodPlayUrlEntityList.value = vodPlayUrlTypeArray.map((e) {
      var vodPlayUrlArray = e.split('#');
      var entityList = vodPlayUrlArray.map((e) {
        var item = e.split('\$');
        return MyBetterPlayerDataSource(
            BetterPlayerDataSourceType.network, item[1], item[0]);
      }).toList();

      return entityList;
    }).toList();
  }
}
