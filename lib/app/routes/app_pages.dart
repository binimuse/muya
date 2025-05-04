import 'package:get/get.dart';

import '../modules/create_resume/bindings/create_resume_binding.dart';
import '../modules/create_resume/views/create_resume_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(name: _Paths.HOME, page: () => HomeView(), binding: HomeBinding()),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_RESUME,
      page: () => const CreateResumeView(),
      binding: CreateResumeBinding(),
    ),
  ];
}
