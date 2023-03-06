import 'package:get/get.dart';

class NetBaseRepository extends GetConnect {
  @override
  void onInit() {
    allowAutoSignedCert = true;

    httpClient.defaultContentType = "application/json";

    https://api.tiankongapi.com/api.php/provide/vod/
    httpClient.baseUrl = "https://api.apilyzy.com/api.php/provide/vod/";

    // 请求拦截
    httpClient.addRequestModifier<void>((request) {
      print(request);
      return request;
    });

    // 响应拦截
    httpClient.addResponseModifier((request, response) {
      print(response);
      return response;
    });
  }
}
