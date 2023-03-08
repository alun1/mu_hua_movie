import 'dart:convert';

import 'package:get/get.dart';
import 'package:mu_hua_movie/service/my_service.dart';
import '../entity/response_base_entity.dart';
import 'net_base_repository.dart';

class NetRepository extends NetBaseRepository {
  Future<ResponseBaseEntity?> getIndex(
      {bool? isList = false, int? page, int? category, String? keyword}) async {
    Map<String, dynamic> map = {};
    if (isList == true) {
      map['ac'] = "list";
    } else {
      map['ac'] = "videolist";
    }

    if (page != null) {
      map['pg'] = page.toString();
    }

    if (category != null) {
      map['t'] = category.toString();
    }
    if (keyword != null && keyword.isNotEmpty) {
      map['wd'] = keyword;
    }

    var selectSourceUrl = Get.find<MyService>().selectSourceUrl.value;
    Response<ResponseBaseEntity> response =
        await get<ResponseBaseEntity>(selectSourceUrl, query: map,
            decoder: (map) {
      return ResponseBaseEntity.fromJson(jsonDecode(map));
    });
    return response.body;
  }
}
