import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mu_hua_movie/modules/player/player_con.dart';

class PlayerScreen extends GetView<PlayerCon> {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white),
      body: Padding(
        padding: EdgeInsets.only(top: context.mediaQueryPadding.top),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Obx(
              () => Center(
                child: controller.isPlayerInit.value
                    ? AspectRatio(
                        aspectRatio:
                            controller.playerController?.value.aspectRatio ??
                                0.8,
                        child: Chewie(
                          controller: controller.chewieController!,
                        ))
                    : CachedNetworkImage(
                        width: Get.width,
                        height: 210,
                        fit: BoxFit.cover,
                        imageUrl: controller.arguments.vodPic),
              ),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Text(
                      controller.arguments.vodName,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.vodPlayFromList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(children: [
                      Obx(() => Radio(
                            value: index,
                            groupValue: controller.currentPlayFromIndex.value,
                            onChanged: (int? value) {
                              controller.currentPlayFromIndex.value = value!;
                            },
                            //controller.currentPlayFromIndex.value
                          )),
                      Text(controller.vodPlayFromList[index],
                          style: const TextStyle(fontSize: 14))
                    ]);
                  }),
            ),
            const Divider(),
            Flexible(
                fit: FlexFit.tight,
                child: Obx(() => GridView.count(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      physics: const AlwaysScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 3,
                      children: controller.vodPlayUrlEntityList[
                              controller.currentPlayFromIndex.value]
                          .map((e) => ElevatedButton(
                              onPressed: () {
                                controller.currentPayUrl = e;
                                controller.initPlayController();
                              },
                              child: Text(e.name)))
                          .toList(),
                    )))
          ],
        ),
      ),
    );
  }
}
