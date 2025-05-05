import 'package:get/get.dart';

import '../controllers/write_cover_letter_controller.dart';

class WriteCoverLetterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WriteCoverLetterController>(
      () => WriteCoverLetterController(),
    );
  }
}
