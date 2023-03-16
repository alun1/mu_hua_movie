import 'package:extended_betterplayer/better_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mu_hua_movie/model/entity/vod_info_entity.dart';
import 'package:talkingdata_sdk_plugin/talkingdata_sdk_plugin.dart';

import 'my_better_player_data_source.dart';

class PlayerCon extends GetxController {
  late VodInfoEntity arguments;
  late RxList<List<MyBetterPlayerDataSource>> vodPlayUrlEntityList = RxList();

  late List<String> vodPlayFromList;
  var currentPlayFromIndex = 0.obs;

  var currentDataSourceIndex = 0.obs;
  final GlobalKey<BetterPlayerPlaylistState> betterPlayerPlaylistStateKey =
      GlobalKey();

  BetterPlayerPlaylistController? get betterPlayerPlaylistController =>
      betterPlayerPlaylistStateKey.currentState?.betterPlayerPlaylistController;

  @override
  void onInit() {
    super.onInit();
    TalkingDataSDK.onPageBegin("播放");
    arguments = Get.arguments;

    vodPlayFromList = arguments.vodPlayFrom.split('\$\$\$');
    String vodPlayUrlStr = arguments.vodPlayUrl;
    analysisUrl(vodPlayUrlStr);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    betterPlayerPlaylistController?.betterPlayerController
        ?.addEventsListener((event) {
      // print("Better player event: ${event.betterPlayerEventType}");
      if (event.betterPlayerEventType ==
          BetterPlayerEventType.setupDataSource) {
        currentDataSourceIndex.value =
            betterPlayerPlaylistController?.currentDataSourceIndex ?? 0;
      }
    });
  }

  @override
  onClose() {
    TalkingDataSDK.onPageEnd("播放");
    super.onClose();
  }

  analysisUrl(String vodPlayUrlStr) {
    var vodPlayUrlTypeArray = vodPlayUrlStr.split('\$\$\$');

    vodPlayUrlTypeArray.removeWhere((element) {
      if (element.contains(".m3u8") ||
          element.contains(".m3u") ||
          element.contains(".mp4")) {
        return false;
      }
      int index = vodPlayUrlTypeArray.indexOf(element);
      vodPlayFromList.removeAt(index);
      return true;
    });

    vodPlayUrlEntityList.value = vodPlayUrlTypeArray.map((e) {
      var vodPlayUrlArray = e.split('#');
      vodPlayUrlArray.removeWhere((element) => element.isEmpty);
      var entityList = vodPlayUrlArray.map((e) {
        var item = e.split('\$');
        return MyBetterPlayerDataSource(
            BetterPlayerDataSourceType.network, item[1], item[0]);
      }).toList();

      return entityList;
    }).toList();
  }
}
