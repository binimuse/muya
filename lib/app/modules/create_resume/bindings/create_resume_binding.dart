import 'package:get/get.dart';

import '../controllers/create_resume_controller.dart';

class CreateResumeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateResumeController>(
      () => CreateResumeController(),
    );
  }
}
