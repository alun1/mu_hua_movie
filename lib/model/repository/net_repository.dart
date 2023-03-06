import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import '../entity/response_base_entity.dart';
import 'net_base_repository.dart';

class NetRepository extends NetBaseRepository {


  Future<ResponseBaseEntity?> getIndex(
      int page, {String? category, String? keyword}) async {
    var map = {
      'ac': "videolist",
      "pg": page.toString(),
    };
    if (category != null && category.isNotEmpty) {
      map['t'] = category;
    }
    if (keyword != null && keyword.isNotEmpty) {
      map['wd'] = keyword;
    }
    Response<ResponseBaseEntity> response =
        await get<ResponseBaseEntity>('', query: map,
            decoder: (map) {

      return ResponseBaseEntity.fromJson( jsonDecode(map));
    });
    return response.body;
  }
//
// Future<String?> getSearch(int page, String keyword) async {
//   var map = {'ac': "videolist", "pg": page, "wd": keyword};
//
//   Response<String> response = await post<String>('', map);
//   return response.body;
// }
//
// Future<String?> getDetail(String movie_id) async {
//   var map = {'ac': "videolist", "ids": movie_id};
//   Response<String> response = await post<String>('api.php/provide/vod/', map);
//   return response.body;
// }
}
