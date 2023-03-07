import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mu_hua_movie/modules/source/source_mange_con.dart';

class SourceMangeScreen extends GetView<SourceMangeCon> {
  const SourceMangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("源管理"),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return const ListTile(
              title: Text("ssss"),
              subtitle: Text("kdjfjddjj"),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
          itemCount: 3),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
