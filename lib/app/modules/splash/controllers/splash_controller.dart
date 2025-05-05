import 'package:get/get.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:muya/app/routes/app_pages.dart';
import 'package:muya/gen/assets.gen.dart';
import 'package:muya/app/services/telegram_service.dart';

class SplashController extends GetxController {
  final String splasehimage = Assets.logos.logo.path;
  final TelegramService telegramService = Get.find<TelegramService>();

  @override
  void onInit() {
    _initializeApp();
    super.onInit();
  }

  Future<void> _initializeApp() async {
    // Shorter delay for web
    await Future.delayed(Duration(seconds: kIsWeb ? 1 : 3));

    // For web, check if Telegram WebApp is initialized
    if (kIsWeb) {
      if (telegramService.userName.value.isEmpty) {
        // If Telegram WebApp is not available, show error and proceed
        print('Telegram WebApp not initialized properly');
      }
    }

    Get.offNamed(Routes.HOME);
  }
}
