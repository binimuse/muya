import 'package:get/get.dart';
import 'dart:js' as js;

class HomeController extends GetxController {
  var templates = ["Sapphire", "Amber", "Garnet", "Topaz", "Onyx"].obs;
  final List<Map<String, String>> resumeSlides = [
    {'title': 'Create Resume', 'subtitle': 'Create a new professional resumes'},
    {'title': 'Edit Resume', 'subtitle': 'Modify your existing resume'},
    {'title': 'Download Resume', 'subtitle': 'Download your resume'},
    {'title': 'Upload Resume', 'subtitle': 'Upload your resume'},
    {'title': 'Share Resume', 'subtitle': 'Share your resume'},
  ];
  var selectedTabIndex = 0.obs;

  // Telegram user data
  final RxString userName = ''.obs;
  final RxString firstName = ''.obs;
  final RxString lastName = ''.obs;
  final RxString phoneNumber = ''.obs;
  final RxString username = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _getTelegramUserData();
  }

  void _getTelegramUserData() {
    try {
      final telegramWebApp = js.context['Telegram']?['WebApp'];
      if (telegramWebApp != null) {
        final initData = telegramWebApp['initData'];
        if (initData != null) {
          final user = initData['user'];
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
          }
        }
      }
    } catch (e) {
      print('Error getting Telegram user data: $e');
    }
  }
}
