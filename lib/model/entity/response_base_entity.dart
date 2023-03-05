import 'package:mu_hua_movie/generated/json/base/json_field.dart';
import 'package:mu_hua_movie/generated/json/response_base_entity.g.dart';
import 'dart:convert';

import 'package:mu_hua_movie/model/entity/vod_info_entity.dart';

@JsonSerializable()
class ResponseBaseEntity {

	int? code;
	String? msg;
	int? page;
	int? pagecount;
	String? limit;
	int? total;
	List<VodInfoEntity>? list;
  
  ResponseBaseEntity();

  factory ResponseBaseEntity.fromJson(Map<String, dynamic> json) => $ResponseBaseEntityFromJson(json);

  Map<String, dynamic> toJson() => $ResponseBaseEntityToJson(this);

  ResponseBaseEntity copyWith({int? code, String? msg, int? page, int? pagecount, String? limit, int? total, List<VodInfoEntity>? list}) {
      return ResponseBaseEntity()..code= code ?? this.code
			..msg= msg ?? this.msg
			..page= page ?? this.page
			..pagecount= pagecount ?? this.pagecount
			..limit= limit ?? this.limit
			..total= total ?? this.total
			..list= list ?? this.list;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}