import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_12/pages/login_page.dart';
import 'package:pas_mobile_11pplg2_12/pages/register_page.dart';
import 'package:pas_mobile_11pplg2_12/pages/main_menu_page.dart';
import 'package:pas_mobile_11pplg2_12/pages/shows_page.dart';
import 'package:pas_mobile_11pplg2_12/pages/bookmark_page.dart';
import 'package:pas_mobile_11pplg2_12/pages/profile_page.dart';
import 'package:pas_mobile_11pplg2_12/pages/splashscreen_page.dart';

import 'package:pas_mobile_11pplg2_12/bindings/login_binding.dart';
import 'package:pas_mobile_11pplg2_12/bindings/register_binding.dart';
import 'package:pas_mobile_11pplg2_12/bindings/main_menu_binding.dart';
import 'package:pas_mobile_11pplg2_12/bindings/shows_binding.dart';
import 'package:pas_mobile_11pplg2_12/bindings/bookmark_binding.dart';
import 'package:pas_mobile_11pplg2_12/bindings/profile_binding.dart';
import 'package:pas_mobile_11pplg2_12/bindings/splashscreen_binding.dart';
import 'package:pas_mobile_11pplg2_12/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.loginPage, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: AppRoutes.registerPage, page: () => RegisterPage(), binding: RegisterBinding()),
    GetPage(name: AppRoutes.mainMenuPage, page: () => MainMenuPage(), binding: MainMenuBinding()),
    GetPage(name: AppRoutes.showsPage, page: () => ShowsPage(), binding: ShowsBinding()),
    GetPage(name: AppRoutes.bookmarkPage, page: () => BookmarkPage(), binding: BookmarkBinding()),
    GetPage(name: AppRoutes.profilePage, page: () => ProfilePage(), binding: ProfileBinding()),
    GetPage(name: AppRoutes.splashscreenPage, page: () => SplashscreenPage(), binding: SplashscreenBinding()),
  ];
}