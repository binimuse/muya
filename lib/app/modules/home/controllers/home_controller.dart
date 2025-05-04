import 'package:get/get.dart';
import 'dart:js' as js;
import 'package:muya/app/common/app_toasts.dart';

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
    _initializeTelegramWebApp();
  }

  void _initializeTelegramWebApp() {
    try {
      final telegramWebApp = js.context['Telegram']?['WebApp'];
      if (telegramWebApp == null) {
        AppToasts.showError('Telegram WebApp is not available');
        print('Telegram WebApp is not available');
        return;
      }

      // Initialize the WebApp
      telegramWebApp.callMethod('ready');
      telegramWebApp.callMethod('expand');

      // Get user data
      final initData = telegramWebApp['initData'];
      if (initData == null) {
        AppToasts.showError('initData is null');
        print('initData is null');
        return;
      }

      final user = initData['user'];
      if (user == null) {
        AppToasts.showError('User data is null');
        print('User data is null');
        return;
      }

      // Set user data
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

      // Print user data for debugging
      print('Telegram User Data:');
      print('First Name: ${firstName.value}');
      print('Last Name: ${lastName.value}');
      print('Username: ${username.value}');
      print('Phone: ${phoneNumber.value}');

      // Show success message
      AppToasts.showSuccess('Telegram WebApp initialized successfully');
    } catch (e) {
      AppToasts.showError('Error initializing Telegram WebApp: $e');
      print('Error initializing Telegram WebApp: $e');
    }
  }
}
