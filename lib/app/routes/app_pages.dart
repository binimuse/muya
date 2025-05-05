import 'package:get/get.dart';

import '../modules/create_resume/bindings/create_resume_binding.dart';
import '../modules/create_resume/views/create_resume_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/write_cover_letter/bindings/write_cover_letter_binding.dart';
import '../modules/write_cover_letter/views/write_cover_letter_view.dart';
import '../modules/write_job_description/bindings/write_job_description_binding.dart';
import '../modules/write_job_description/views/write_job_description_view.dart';

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
    GetPage(
      name: _Paths.WRITE_JOB_DESCRIPTION,
      page: () => const WriteJobDescriptionView(),
      binding: WriteJobDescriptionBinding(),
    ),
    GetPage(
      name: _Paths.WRITE_COVER_LETTER,
      page: () => const WriteCoverLetterView(),
      binding: WriteCoverLetterBinding(),
    ),
  ];
}
