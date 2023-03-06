import 'package:extended_betterplayer/better_player.dart';

class MyBetterPlayerDataSource extends BetterPlayerDataSource {
  final String name;
  MyBetterPlayerDataSource(super.type, super.url, this.name);
}
