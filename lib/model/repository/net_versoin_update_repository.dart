import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'net_base_repository.dart';

typedef OnDownloadProgress = void Function(int byteCount, int totalBytes);

class NetVersionUpdateRepository extends NetBaseRepository {
  Future<Map<String, dynamic>?> getUpdateInfo() async {
    Response<Map<String, dynamic>> response = await get<Map<String, dynamic>>(
        "https://ec2-3-85-234-92.compute-1.amazonaws.com/version_update.json");
    return response.body;
  }

  Future downApp(url, {OnDownloadProgress? onDownloadProgress}) async {
    final HttpClientResponse httpResponse;
    try {
      final Uri resolved = Uri.base.resolve(url);
      HttpClient httpClient = HttpClient();
      httpClient.badCertificateCallback = (cert, host, port) => true;
      final HttpClientRequest req = await httpClient.getUrl(resolved);
      httpResponse = await req.close();
    } catch (e) {
      return Future.error(e);
    }
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String path = "${appDocDir.path}/eeee.apk";
    File file = File(path);
    var raf = file.openSync(mode: FileMode.write);
    int totalBytes = httpResponse.contentLength;
    int byteCount = 0;
    Completer completer = Completer<String>();
    httpResponse.listen((event) {
      if (onDownloadProgress != null) {
        byteCount += event.length;
        onDownloadProgress(byteCount, totalBytes);
      }
      raf.writeFromSync(event);
    }, onDone: () {
      raf.closeSync();
      completer.complete(file.path);
    }, onError: (err) {
      raf.closeSync();
      file.deleteSync();
      completer.completeError(err);
    }, cancelOnError: true);

    return completer.future;
  }
}
