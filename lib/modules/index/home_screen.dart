import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../utils/EsoImageCacheManager.dart';
import 'controller/home_con.dart';

class HomeScreen extends GetView<HomeCon> {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: Obx(() {
            return Visibility(
                visible: !controller.isShowSearch.value,
                child: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    }));
          }),
          title: Obx(
            () => Stack(
              children: [
                Visibility(
                    visible: !controller.isShowSearch.value,
                    child: const Text("慕华电影")),
                Visibility(
                  visible: controller.isShowSearch.value,
                  child: TextField(
                    onSubmitted: (text) {
                      controller.page = 1;
                      controller.keyword.value = text;
                      controller.getIndex();
                    },
                    decoration: InputDecoration(
                        prefixIcon: IconButton(
                            onPressed: () {
                              controller.page = 1;
                              controller.keyword.value = "";
                              controller.getIndex();
                              controller.isShowSearch.value = false;
                            },
                            icon: const Icon(Icons.arrow_back)),
                        suffix: IconButton(
                          onPressed: () {
                            controller.page = 1;
                            controller.keyword.value = "";
                            controller.getIndex();
                          },
                          icon: const Icon(Icons.clear),
                        ),
                        hintText: "输入后点击软键盘回车键搜索"),
                  ),
                )
              ],
            ),
          ),
          actions: [
            Obx(() => Visibility(
                  visible: !controller.isShowSearch.value,
                  child: IconButton(
                      onPressed: () {
                        controller.isShowSearch.value = true;
                      },
                      icon: const Icon(Icons.search)),
                ))
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: const [DrawerHeader(child: Text("SSSS"))],
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            controller.page = 1;
            await controller.getIndex();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Obx(() => MasonryGridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  shrinkWrap: true,
                  itemCount: controller.vodInfo.length,
                  itemBuilder: (context, index) {
                    if (controller.page <= controller.pageC &&
                        index == controller.vodInfo.length - 1) {
                      controller.getIndex();
                    }
                    var element = controller.vodInfo[index];

                    return Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: element.vodPic,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                                      value: downloadProgress.progress),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.cover,
                          cacheManager: EsoImageCacheManager(),
                        ),
                        Text(element.vodName,
                            maxLines: 3, overflow: TextOverflow.ellipsis)
                      ],
                    );
                  },
                )),
          ),
        ));
  }
}
