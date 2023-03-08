import 'package:get/get.dart';
import 'package:mu_hua_movie/modules/index/home_con.dart';
import 'package:mu_hua_movie/modules/index/home_screen.dart';
import 'package:mu_hua_movie/modules/player/player_con.dart';
import 'package:mu_hua_movie/modules/player/player_screen.dart';
import 'package:mu_hua_movie/modules/source/source_mange_con.dart';
import 'package:mu_hua_movie/modules/splash/splash_screen.dart';

import '../modules/source/source_mange_screen.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = Routes.splash;

  static final List<GetPage> uPages = [
    GetPage(name: Routes.splash, page: () => const SplashScreen()),
    GetPage(
        name: Routes.home,
        page: () => HomeScreen(),
        binding: BindingsBuilder.put(() => HomeCon())),
    GetPage(
        name: Routes.player,
        page: () => PlayerScreen(),
        binding: BindingsBuilder.put(() => PlayerCon())),
    GetPage(
        name: Routes.source,
        page: () => const SourceMangeScreen(),
        binding: BindingsBuilder.put(() => SourceMangeCon())),
  ];
}
