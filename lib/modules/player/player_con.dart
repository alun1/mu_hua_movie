import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:mu_hua_movie/model/entity/vod_info_entity.dart';
import 'package:mu_hua_movie/modules/player/play_url_entity.dart';
import 'package:video_player/video_player.dart';

class PlayerCon extends GetxController {
  late VodInfoEntity arguments;
  late List<List<PlayUrlEntity>> vodPlayUrlEntityList;
  RxBool isPlayerInit = false.obs;
  PlayUrlEntity? currentPayUrl;

  ChewieController? chewieController;
  VideoPlayerController? playerController;
  late List<String> vodPlayFromList;
  var currentPlayFromIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    arguments = Get.arguments;

    vodPlayFromList = arguments.vodPlayFrom.split('\$\$\$');
    String vodPlayUrlStr = arguments.vodPlayUrl;
    analysisUrl(vodPlayUrlStr);
    currentPayUrl = vodPlayUrlEntityList[currentPlayFromIndex.value][0];
    initPlayController();
  }

  initPlayController() async {

    // chewieController?.dispose();
    // chewieController= null;
    // await playerController?.dispose();
    // playerController= null;
    playerController = VideoPlayerController.network(currentPayUrl?.url ?? "");
    await playerController?.initialize();

    chewieController = ChewieController(
      videoPlayerController: playerController!,
      aspectRatio: playerController?.value.aspectRatio,
      autoPlay: true,
      looping: true,
    );

    isPlayerInit.value = true;
  }

  analysisUrl(String vodPlayUrlStr) {
    var vodPlayUrlTypeArray = vodPlayUrlStr.split('\$\$\$');

    vodPlayUrlEntityList = vodPlayUrlTypeArray.map((e) {
      var vodPlayUrlArray = e.split('#');
      var entityList = vodPlayUrlArray.map((e) {
        var item = e.split('\$');
        return PlayUrlEntity(item[0], item[1]);
      }).toList();

      return entityList;
    }).toList();
  }

  @override
  void onClose() {
    playerController?.dispose();
    chewieController?.dispose();
    super.onClose();
  }
}
