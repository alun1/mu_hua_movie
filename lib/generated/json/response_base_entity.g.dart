import 'package:mu_hua_movie/generated/json/base/json_convert_content.dart';
import 'package:mu_hua_movie/model/entity/response_base_entity.dart';
import 'package:mu_hua_movie/model/entity/vd_class.dart';

import 'package:mu_hua_movie/model/entity/vod_info_entity.dart';


ResponseBaseEntity $ResponseBaseEntityFromJson(Map<String, dynamic> json) {
	final ResponseBaseEntity responseBaseEntity = ResponseBaseEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		responseBaseEntity.code = code;
	}
	final String? msg = jsonConvert.convert<String>(json['msg']);
	if (msg != null) {
		responseBaseEntity.msg = msg;
	}
	final int? page = jsonConvert.convert<int>(json['page']);
	if (page != null) {
		responseBaseEntity.page = page;
	}
	final int? pagecount = jsonConvert.convert<int>(json['pagecount']);
	if (pagecount != null) {
		responseBaseEntity.pagecount = pagecount;
	}
	final String? limit = jsonConvert.convert<String>(json['limit']);
	if (limit != null) {
		responseBaseEntity.limit = limit;
	}
	final int? total = jsonConvert.convert<int>(json['total']);
	if (total != null) {
		responseBaseEntity.total = total;
	}
	final List<VodInfoEntity>? list = jsonConvert.convertListNotNull<VodInfoEntity>(json['list']);
	if (list != null) {
		responseBaseEntity.list = list;
	}
	final List<VdClass>? xClass = jsonConvert.convertListNotNull<VdClass>(json['class']);
	if (xClass != null) {
		responseBaseEntity.xClass = xClass;
	}
	return responseBaseEntity;
}

Map<String, dynamic> $ResponseBaseEntityToJson(ResponseBaseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['page'] = entity.page;
	data['pagecount'] = entity.pagecount;
	data['limit'] = entity.limit;
	data['total'] = entity.total;
	data['list'] =  entity.list?.map((v) => v.toJson()).toList();
	data['class'] =  entity.xClass.map((v) => v.toJson()).toList();
	return data;
}