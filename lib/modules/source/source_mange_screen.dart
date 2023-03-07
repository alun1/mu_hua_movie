import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mu_hua_movie/modules/source/source_entity.dart';
import 'package:mu_hua_movie/modules/source/source_mange_con.dart';

class SourceMangeScreen extends GetView<SourceMangeCon> {
  const SourceMangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("源管理"),
      ),
      body: Obx(
        () {
          return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                SourceEntity? source = controller.sourceBox.getAt(index);
                return Obx(() => RadioListTile(
                      title: Row(
                        children: [
                          Text(source?.name ?? ""),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                controller.addName = source?.name ?? "";
                                controller.addUrl = source?.url ?? "";
                                showEdit(context);
                              },
                              icon: const Icon(Icons.edit, size: 20)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.delete, size: 20))
                        ],
                      ),
                      subtitle: Text(source?.url ?? ""),
                      value: source?.name ?? "",
                      groupValue: controller.selectKey.value,
                      onChanged: (value) {
                        controller.selectKey.value = source?.name ?? "";
                        controller.changeSelectSource(source?.name ?? "");
                      },
                    ));
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
              itemCount: controller.count.value);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.addName = "";
          controller.addUrl = "";
          showEdit(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  showEdit(BuildContext context) {
    GlobalKey<FormState> key = GlobalKey();
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return AnimatedPadding(
              padding: MediaQuery.of(context).viewInsets,
              duration: const Duration(milliseconds: 100),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("添加源",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Form(
                      key: key,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            initialValue: controller.addName,
                            maxLines: 1,
                            maxLength: 10,
                            decoration: const InputDecoration(
                                labelText: "标题", hintText: "标题相同会被覆盖哦！！"),
                            validator: (v) {
                              if (v?.isEmpty == true) {
                                return "不能为空哦";
                              }
                              return null;
                            },
                            onSaved: (v) {
                              controller.addName = v!;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            initialValue: controller.addUrl,
                            maxLength: 200,
                            validator: (v) {
                              if (v?.isEmpty == true) {
                                return "不能为空哦";
                              }
                              return null;
                            },
                            onSaved: (v) {
                              controller.addUrl = v!;
                            },
                            decoration: const InputDecoration(labelText: "源地址"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                        style: ButtonStyle(
                            fixedSize:
                                MaterialStateProperty.all(const Size(200, 50))),
                        onPressed: () {
                          var state = key.currentState;
                          if (state?.validate() == true) {
                            state?.save();
                            controller.addSource();
                          }
                        },
                        child: const Text("添加"))
                  ],
                ),
              ));
        });
  }
}
