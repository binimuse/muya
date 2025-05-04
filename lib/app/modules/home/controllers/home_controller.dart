import 'package:get/get.dart';

class HomeController extends GetxController {
  var templates = ["Sapphire", "Amber", "Garnet", "Topaz", "Onyx"].obs;
  final List<Map<String, String>> resumeSlides = [
    {
      'title': 'Create Resume',
      'subtitle': 'Professional template for all jobs',
    },

    {'title': 'Upload Resume', 'subtitle': 'Modern template for tech roles'},
    {'title': 'Write job description', 'subtitle': 'Write job description '},
  ];
  var selectedTabIndex = 0.obs;
}
