import 'dart:js' as js;
import 'package:get/get.dart';

class TelegramService extends GetxService {
  static TelegramService get to => Get.find();

  final RxString userName = ''.obs;
  final RxString firstName = ''.obs;
  final RxString lastName = ''.obs;
  final RxString phoneNumber = ''.obs;
  final RxString username = ''.obs;
  final RxString initData = ''.obs;

  @override
  void onInit() {
    super.onInit();
    initializeTelegramWebApp();
  }

  void initializeTelegramWebApp() {
    try {
      final telegramWebApp = js.context['Telegram']?['WebApp'];
      if (telegramWebApp == null) {
        print('Telegram WebApp is not available');
        return;
      }

      // Init the Telegram WebApp
      telegramWebApp.callMethod('ready');
      telegramWebApp.callMethod('expand');

      // Get raw initData string
      final rawInitData = telegramWebApp['initData'];
      if (rawInitData != null) {
        initData.value = rawInitData;
      }

      // ✅ FIX: Get user from initDataUnsafe
      final user = telegramWebApp['initDataUnsafe']?['user'];
      if (user != null) {
        firstName.value = user['first_name'] ?? '';
        lastName.value = user['last_name'] ?? '';
        username.value = user['username'] ?? '';
        phoneNumber.value = user['phone_number'] ?? '';

        // Set display name
        if (firstName.value.isNotEmpty || lastName.value.isNotEmpty) {
          userName.value = '${firstName.value} ${lastName.value}'.trim();
        } else if (username.value.isNotEmpty) {
          userName.value = '@${username.value}';
        } else {
          userName.value = 'User';
        }

        print('✅ Telegram User Loaded:');
        print('First Name: ${firstName.value}');
        print('Last Name: ${lastName.value}');
        print('Username: ${username.value}');
        print('Phone: ${phoneNumber.value}');
        print('InitData: ${initData.value}');
      } else {
        print('⚠️ Telegram user not found in initDataUnsafe');
      }
    } catch (e) {
      print('❌ Error initializing Telegram WebApp: $e');
    }
  }

  String? getInitData() {
    return initData.value;
  }
}
