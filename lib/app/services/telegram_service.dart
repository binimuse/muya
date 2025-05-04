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

      // Initialize the WebApp
      telegramWebApp.callMethod('ready');
      telegramWebApp.callMethod('expand');

      // Get initData
      final rawInitData = telegramWebApp['initData'];
      if (rawInitData != null) {
        initData.value = rawInitData;
      }

      // Get user data
      final user = telegramWebApp['initData']?['user'];
      if (user != null) {
        firstName.value = user['first_name'] ?? '';
        lastName.value = user['last_name'] ?? '';
        phoneNumber.value = user['phone_number'] ?? '';
        username.value = user['username'] ?? '';

        // Set the display name
        if (firstName.value.isNotEmpty || lastName.value.isNotEmpty) {
          userName.value = '${firstName.value} ${lastName.value}'.trim();
        } else if (username.value.isNotEmpty) {
          userName.value = '@${username.value}';
        } else {
          userName.value = 'User';
        }

        print('Telegram User Data:');
        print('First Name: ${firstName.value}');
        print('Last Name: ${lastName.value}');
        print('Username: ${username.value}');
        print('Phone: ${phoneNumber.value}');
        print('Init Data: ${initData.value}');
      }
    } catch (e) {
      print('Error initializing Telegram WebApp: $e');
    }
  }

  String? getInitData() {
    return initData.value;
  }
}
