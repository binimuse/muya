import 'package:get/get.dart';

import '../controllers/write_job_description_controller.dart';

class WriteJobDescriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WriteJobDescriptionController>(
      () => WriteJobDescriptionController(),
    );
  }
}
