import 'dart:io';

import 'package:get/get.dart';

import 'net_base_repository.dart';

typedef OnDownloadProgress = void Function(int byteCount, int totalBytes);

class NetVersionUpdateRepository extends NetBaseRepository {
  Future<Map<String, dynamic>?> getUpdateInfo() async {
    Response<Map<String, dynamic>> response = await get<Map<String, dynamic>>(
        "https://ec2-3-85-234-92.compute-1.amazonaws.com/version_update.json");
    return response.body;
  }

  downApp(url, path, {OnDownloadProgress? onDownloadProgress}) async {
    Response response = await get(url);

    File file = File(path);
    var raf = file.openSync(mode: FileMode.write);

  //  int byteCount = 0;

    response.bodyBytes?.listen((event) {
      // if (onDownloadProgress != null) {
      //   byteCount += event.length;
      //   onDownloadProgress()
      // }
      raf.writeFromSync(event);
    }, onDone: () {
      raf.closeSync();
    }, onError: (err) {
      raf.closeSync();
      file.deleteSync();
    });
  }
}