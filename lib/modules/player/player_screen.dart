import 'package:cached_network_image/cached_network_image.dart';

import 'package:extended_betterplayer/better_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mu_hua_movie/modules/player/player_con.dart';

class PlayerScreen extends GetView<PlayerCon> {
  PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        // systemOverlayStyle: const SystemUiOverlayStyle(
        //     statusBarIconBrightness: Brightness.dark),
        // backgroundColor: Colors.transparent,
        // foregroundColor: Colors.white
        title: Text(controller.arguments.vodName ?? ""),
      ),

      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Obx(
            () => BetterPlayerPlaylist(
                key: controller.betterPlayerPlaylistStateKey,
                betterPlayerConfiguration: const BetterPlayerConfiguration(
                  fit: BoxFit.contain,
                  autoPlay: true,
                  looping: true,
                  // placeholder: CachedNetworkImage(
                  //     width: Get.width,
                  //     fit: BoxFit.cover,
                  //     imageUrl: controller.arguments.vodPic),
                  allowedScreenSleep: false,
                  autoDetectFullscreenDeviceOrientation: true,
                  autoDetectFullscreenAspectRatio: true,
                ),
                betterPlayerPlaylistConfiguration:
                    const BetterPlayerPlaylistConfiguration(),
                betterPlayerDataSourceList: controller.vodPlayUrlEntityList[
                    controller.currentPlayFromIndex.value]),
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        textBaseline: TextBaseline.ideographic,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.arguments.vodName,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "演员：${controller.arguments.vodActor}",
                            style: const TextStyle(fontSize: 12),
                          ),
                          Text(
                              "共${controller.arguments.vodTotal}集   ${controller.arguments.vodPubdate}"),
                          Text("简介：\n${controller.arguments.vodBlurb}"),
                        ],
                      ),
                    );
                  });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Obx(
                      () => Text(
                        controller
                            .vodPlayUrlEntityList[controller
                                .currentPlayFromIndex
                                .value][controller.currentDataSourceIndex.value]
                            .name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const Text(
                    "介绍",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const Icon(Icons.arrow_forward_ios,
                      size: 12, color: Colors.grey)
                ],
              ),
            ),
          ),
          const Divider(),
          SizedBox(
            height: 40,
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2));
                },
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                scrollDirection: Axis.horizontal,
                itemCount: controller.vodPlayFromList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(children: [
                    Obx(() => Radio(
                          value: index,
                          groupValue: controller.currentPlayFromIndex.value,
                          onChanged: (int? value) {
                            controller.currentPlayFromIndex.value = value!;

                            controller.betterPlayerPlaylistController
                                ?.setupDataSourceList(
                                    controller.vodPlayUrlEntityList[value]);
                          },
                        )),
                    Text(controller.vodPlayFromList[index],
                        style: const TextStyle(fontSize: 14))
                  ]);
                }),
          ),
          const Divider(),
          Flexible(
              fit: FlexFit.tight,
              child: Obx(() {
                var currentList = controller.vodPlayUrlEntityList[
                    controller.currentPlayFromIndex.value];
                return GridView.count(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  physics: const AlwaysScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 3,
                  children: currentList.map((e) {
                    var index = currentList.indexOf(e);
                    return ElevatedButton(
                        onPressed:
                            index == controller.currentDataSourceIndex.value
                                ? null
                                : () {
                                    controller.betterPlayerPlaylistController
                                        ?.setupDataSource(index);
                                  },
                        child: Text(e.name));
                  }).toList(),
                );
              }))
        ],
      ),
    );
  }
}
