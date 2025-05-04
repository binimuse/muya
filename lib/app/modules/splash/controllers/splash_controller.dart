import 'package:get/get.dart';
import 'package:muya/app/common/app_toasts.dart';
import 'package:muya/app/routes/app_pages.dart';
import 'package:muya/gen/assets.gen.dart';

import 'package:permission_handler/permission_handler.dart';

class SplashController extends GetxController {
  final String splasehimage = Assets.logos.logo.path;

  @override
  void onInit() {
    _initializeApp();
    super.onInit();
  }

  Future<void> _initializeApp() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offNamed(Routes.HOME);
    // First check notification permission
    // final notificationPermissionStatus = await requestNotificationPermission();

    // if (notificationPermissionStatus == PermissionStatus.granted) {
    //   await _checkAuthAndNavigate();
    // } else {
    //   AppToasts.showError("Please Enable Permissions".tr);
    //   await openAppSettings();
    //   // After opening settings, check again
    //   await _checkAuthAndNavigate();
    // }
  }
}
