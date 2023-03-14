import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:mu_hua_movie/service/my_service.dart';
import 'package:share_plus/share_plus.dart';
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
                  controller.isShowSearch.value = true;
                },
                icon: const Icon(Icons.search)),
            OutlinedButton.icon(
                onPressed: () {
                  _scaffoldKey.currentState?.openEndDrawer();
                },
              icon: const Icon(Icons.category),
              label: Obx(()=> Text(controller.category.value?.typeName??"全部",style: const TextStyle(fontSize: 12),)),
              ),
          ],
        ),
        endDrawer: Drawer(
          width: 200,
          child: Obx(
            () => ListView.separated(
              itemCount: controller.vdClass.length + 1,
              itemBuilder: (context, index) {
                return Obx(
                  () => RadioListTile(
                    title: Text(index == 0
                        ? "全部"
                        : controller.vdClass[index - 1].typeName),
                    value: index == 0 ? null : controller.vdClass[index - 1],
                    groupValue: controller.category.value,
                    onChanged: (value) {
                      if (index == 0) {
                        controller.category.value = null;
                      } else {
                        controller.category.value =
                            controller.vdClass[index - 1];
                      }
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
          width: 220,
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
                  title: const Text("分享本app"),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                  onTap: () {
                    Share.share('复制到浏览器下载 https://ec2-3-85-234-92.compute-1.amazonaws.com/app-release.apk');
                  })
              // ListTile(
              //     title: const Text("订阅"),
              //     trailing: const Icon(
              //       Icons.arrow_forward_ios,
              //       size: 15,
              //     ),
              //     onTap: () {})
            ],
          ),
        ),
        body: Column(
          children: [
            Obx(
              () => Visibility(
                visible: controller.isShowSearch.value,
                child: SizedBox(
                  height: 55,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      onSubmitted: (text) {
                        controller.page = 1;
                        controller.keyword.value = text;
                        controller.getIndex();
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          contentPadding:
                              const EdgeInsets.fromLTRB(16, 0, 16, 0),
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.isShowSearch.value = false;
                              controller.page = 1;
                              controller.keyword.value = "";
                              controller.getIndex();
                            },
                            icon: const Icon(Icons.clear),
                          ),
                          hintText: "输入后点击软键盘回车键搜索"),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: RefreshIndicator(
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
                                      (context, url, downloadProgress) =>
                                          SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: CircularProgressIndicator(
                                        value: downloadProgress.progress),
                                  ),
                                  errorWidget: (context, url, error) {
                                    return const Icon(Icons.error);
                                  },
                                  fit: BoxFit.cover,
                                  cacheManager: EsoImageCacheManager(),
                                ),
                                // Image.network( element.vodPic),
                                Text(element.vodName,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis)
                              ],
                            ),
                            onTap: () {
                              Get.toNamed(Routes.player, arguments: element);
                            },
                          );
                        },
                      )),
                ),
              ),
            ),
          ],
        ));
  }
}
