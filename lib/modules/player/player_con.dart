import 'package:get/get.dart';
import 'package:mu_hua_movie/model/entity/vod_info_entity.dart';
import 'package:mu_hua_movie/modules/player/play_url_entity.dart';
import 'package:video_player/video_player.dart';

class PlayerCon extends GetxController {
  VideoPlayerController? playerController;
  late VodInfoEntity arguments;
  late List<PlayUrlEntity> vodPlayUrlEntityList;
  RxBool isPlayerInit = false.obs;
  PlayUrlEntity? currentPayUrl;

  @override
  void onInit() {
    super.onInit();
    arguments = Get.arguments;

    String vodPlayUrlStr = arguments.vodPlayUrl;

    var vodPlayUrlArray = vodPlayUrlStr.split('#');

    vodPlayUrlEntityList = vodPlayUrlArray.map((e) {
      var item = e.split('\$');
      return PlayUrlEntity(item[0], item[1]);
    }).toList();
    currentPayUrl = vodPlayUrlEntityList[20];
    initPlayController();
  }

  initPlayController() {
    playerController?.dispose();
    isPlayerInit.value = false;
    playerController = VideoPlayerController.network(currentPayUrl?.url ?? "")
      ..initialize().then((_) {
        isPlayerInit.value = true;
      });
  }
}
