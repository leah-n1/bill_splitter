import 'package:get/get.dart';

import '../../presentation/screen/home_detail_screen/bindings/home_detail_screen_binding.dart';
import '../../presentation/screen/home_detail_screen/views/home_detail_screen_view.dart';
import '../../presentation/screen/home_screen/bindings/home_screen_binding.dart';
import '../../presentation/screen/home_screen/view/home_screen.dart';
import '../../presentation/screen/login_screen/bindings/login_screen_binding.dart';
import '../../presentation/screen/login_screen/views/login_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeScreen(
        title: 'Home',
      ),
      binding: HomeScreenBinding(),
      ),
    
    GetPage(
      name: _Paths.HOME_DETAIL_SCREEN,
      page: () => const HomeDetailScreenView(),
      binding: HomeDetailScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => const LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
  ];
}
