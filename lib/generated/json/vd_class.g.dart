import 'package:mu_hua_movie/generated/json/base/json_convert_content.dart';
import 'package:mu_hua_movie/model/entity/vd_class.dart';

VdClass $VdClassFromJson(Map<String, dynamic> json) {
	final VdClass vdClass = VdClass();
	final int? typeId = jsonConvert.convert<int>(json['type_id']);
	if (typeId != null) {
		vdClass.typeId = typeId;
	}
	final int? typePid = jsonConvert.convert<int>(json['type_pid']);
	if (typePid != null) {
		vdClass.typePid = typePid;
	}
	final String? typeName = jsonConvert.convert<String>(json['type_name']);
	if (typeName != null) {
		vdClass.typeName = typeName;
	}
	return vdClass;
}

Map<String, dynamic> $VdClassToJson(VdClass entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['type_id'] = entity.typeId;
	data['type_pid'] = entity.typePid;
	data['type_name'] = entity.typeName;
	return data;
}