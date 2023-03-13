import 'package:get/get.dart';

import 'net_base_repository.dart';

class NetVersionUpdateRepository extends NetBaseRepository {
  Future<Map<String, dynamic>?> getUpdateInfo() async {
    Response<Map<String, dynamic>> response = await get<Map<String, dynamic>>(
        "https://ec2-3-85-234-92.compute-1.amazonaws.com/version_update.json");
    return response.body;
  }
}
