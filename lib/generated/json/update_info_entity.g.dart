import 'package:mu_hua_movie/generated/json/base/json_convert_content.dart';
import 'package:mu_hua_movie/model/entity/update_info_entity.dart';

UpdateInfoEntity $UpdateInfoEntityFromJson(Map<String, dynamic> json) {
	final UpdateInfoEntity updateInfoEntity = UpdateInfoEntity();
	final int? versionCode = jsonConvert.convert<int>(json['versionCode']);
	if (versionCode != null) {
		updateInfoEntity.versionCode = versionCode;
	}
	final String? versionName = jsonConvert.convert<String>(json['versionName']);
	if (versionName != null) {
		updateInfoEntity.versionName = versionName;
	}
	final String? log = jsonConvert.convert<String>(json['log']);
	if (log != null) {
		updateInfoEntity.log = log;
	}
	final int? force = jsonConvert.convert<int>(json['force']);
	if (force != null) {
		updateInfoEntity.force = force;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		updateInfoEntity.url = url;
	}
	return updateInfoEntity;
}

Map<String, dynamic> $UpdateInfoEntityToJson(UpdateInfoEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['versionCode'] = entity.versionCode;
	data['versionName'] = entity.versionName;
	data['log'] = entity.log;
	data['force'] = entity.force;
	data['url'] = entity.url;
	return data;
}