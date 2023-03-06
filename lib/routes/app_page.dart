import 'package:get/get.dart';
import 'package:mu_hua_movie/modules/index/home_con.dart';
import 'package:mu_hua_movie/modules/index/home_screen.dart';
import 'package:mu_hua_movie/modules/player/player_con.dart';
import 'package:mu_hua_movie/modules/player/player_screen.dart';

import 'app_routes.dart';

class AppPages {
  static const initial = Routes.home;

  static final List<GetPage> uPages = [
    GetPage(
        name: Routes.home,
        page: () =>  HomeScreen(),
        binding: BindingsBuilder.put(() => HomeCon())),

    GetPage(
        name: Routes.player,
        page: () =>  const PlayerScreen(),
        binding: BindingsBuilder.put(() => PlayerCon())),



  ];
}
