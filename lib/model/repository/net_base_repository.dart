import 'package:get/get.dart';

class NetBaseRepository extends GetConnect {
  @override
  void onInit() {
    allowAutoSignedCert = true;

    httpClient.defaultContentType = "application/json";

    httpClient.timeout = const Duration(seconds: 30);
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
