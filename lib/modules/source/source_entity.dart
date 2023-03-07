import 'package:hive/hive.dart';

part 'source_entity.g.dart';

@HiveType(typeId: 0)
class SourceEntity {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String url;
  @HiveField(2, defaultValue: false)
  late bool isSelect;

  SourceEntity(this.name, this.url, this.isSelect);
}
