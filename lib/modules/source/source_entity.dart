import 'package:hive/hive.dart';

part 'source_entity.g.dart';

@HiveType(typeId: 0)
class SourceEntity {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String url;

  SourceEntity(this.name, this.url);
}
