import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:mu_hua_movie/service/my_service.dart';
import '../../routes/app_routes.dart';
import '../../utils/EsoImageCacheManager.dart';
import 'home_con.dart';

class HomeScreen extends GetView<HomeCon> {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              }),
          title: const Text("源播"),
          actions: [
            IconButton(
                onPressed: () {
                  // controller.isShowSearch.value = true;
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
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
                        );
                      });
                },
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  _scaffoldKey.currentState?.openEndDrawer();
                },
                icon: const Icon(Icons.category)),
          ],
        ),
        endDrawer: Drawer(
          width: 200,
          child: Obx(
            () => ListView.separated(
              itemCount: controller.vdClass.length,
              itemBuilder: (context, index) {
                return Obx(
                  () => RadioListTile(
                    title: Text(controller.vdClass[index].typeName),
                    value: controller.vdClass[index].typeId,
                    groupValue: controller.categoryId.value,
                    onChanged: (value) {
                      controller.categoryId.value =
                          controller.vdClass[index].typeId;
                      controller.page = 1;
                      controller.getIndex();
                    },
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 5,
                );
              },
            ),
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                  child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "源播",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Obx(() => Text(
                        "当前播放源：${Get.find<MyService>().selectSourceKey.value}")),
                  ],
                ),
              )),
              ListTile(
                  title: const Text("源管理"),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                  onTap: () {
                    Get.toNamed(Routes.source);
                  }),
              const Divider(),
              ListTile(
                  title: const Text("订阅"),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                  onTap: () {})
            ],
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

                    return InkWell(
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl: element.vodPic,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => SizedBox(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator(
                                  value: downloadProgress.progress),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.cover,
                            cacheManager: EsoImageCacheManager(),
                          ),
                          Text(element.vodName,
                              maxLines: 3, overflow: TextOverflow.ellipsis)
                        ],
                      ),
                      onTap: () {
                        Get.toNamed(Routes.player, arguments: element);
                      },
                    );
                  },
                )),
          ),
        ));
  }
}
