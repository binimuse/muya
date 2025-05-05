import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muya/app/theme/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.primary,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                controller.splasehimage,
                fit: BoxFit.contain,
                width: kIsWeb ? 30.w : 40.w,
                height: kIsWeb ? 30.w : 40.w,
              ),
              if (!kIsWeb) SizedBox(height: 1.h),
            ],
          ),
        ),
      ),
    );
  }
}
