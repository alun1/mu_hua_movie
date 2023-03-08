import 'package:mu_hua_movie/generated/json/base/json_field.dart';

import 'dart:convert';

import '../../generated/json/vd_class.g.dart';

@JsonSerializable()
class VdClass {
  @JSONField(name: "type_id")
  late int typeId;
  @JSONField(name: "type_pid")
  late int typePid;
  @JSONField(name: "type_name")
  late String typeName;

  VdClass();

  factory VdClass.fromJson(Map<String, dynamic> json) => $VdClassFromJson(json);

  Map<String, dynamic> toJson() => $VdClassToJson(this);

  VdClass copyWith({int? typeId, int? typePid, String? typeName}) {
    return VdClass()
      ..typeId = typeId ?? this.typeId
      ..typePid = typePid ?? this.typePid
      ..typeName = typeName ?? this.typeName;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}
