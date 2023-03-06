import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mu_hua_movie/modules/player/player_con.dart';
import 'package:video_player/video_player.dart';

class PlayerScreen extends GetView<PlayerCon> {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(controller.arguments.vodName),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Obx(
                () => Center(
                  child: controller.isPlayerInit.value
                      ? AspectRatio(
                          aspectRatio:
                              controller.playerController?.value.aspectRatio ??
                                  0.8,
                          child: VideoPlayer(controller.playerController!),
                        )
                      : CachedNetworkImage(
                          width: Get.width,
                          height: 210,
                          fit: BoxFit.cover,
                          imageUrl: controller.arguments.vodPic),
                ),
              ),
              Text(controller.arguments.vodContent)
            ],
          )),
          SliverGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2,
            children: controller.vodPlayUrlEntityList
                .map((e) => ElevatedButton(
                    onPressed: () {
                      // controller.playerController.dataSource
                      controller.currentPayUrl = e;
                      controller.initPlayController();
                    },
                    child: Text(e.name)))
                .toList(),
          )
        ],
      ),
    );
  }
}
