import 'package:get/get.dart';
import 'package:muya/app/common/app_toasts.dart';
import 'package:muya/app/services/telegram_service.dart';

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

  // Get Telegram service
  final TelegramService telegramService = Get.find<TelegramService>();

  // Telegram user data
  RxString get userName => telegramService.userName;
  RxString get firstName => telegramService.firstName;
  RxString get lastName => telegramService.lastName;
  RxString get phoneNumber => telegramService.phoneNumber;
  RxString get username => telegramService.username;

  @override
  void onInit() {
    super.onInit();
    // Show toast if Telegram WebApp is not available
    if (telegramService.userName.value.isEmpty) {
      AppToasts.showError('Telegram WebApp is not available');
    }
  }
}
