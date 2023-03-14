import 'package:mu_hua_movie/generated/json/base/json_field.dart';
import 'package:mu_hua_movie/generated/json/update_info_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class UpdateInfoEntity {

	late int versionCode;
	late String versionName;
	late String log;
	late int force;
	late String url;
  
  UpdateInfoEntity();

  factory UpdateInfoEntity.fromJson(Map<String, dynamic> json) => $UpdateInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $UpdateInfoEntityToJson(this);

  UpdateInfoEntity copyWith({int? versionCode, String? versionName, String? log, int? force, String? url}) {
      return UpdateInfoEntity()..versionCode= versionCode ?? this.versionCode
			..versionName= versionName ?? this.versionName
			..log= log ?? this.log
			..force= force ?? this.force
			..url= url ?? this.url;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}