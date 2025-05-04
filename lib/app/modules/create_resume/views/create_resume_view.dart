import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:muya/app/modules/create_resume/views/create_resume_form_view.dart';
import 'package:muya/app/theme/app_colors.dart';
import 'package:muya/app/theme/app_sizes.dart';
import 'package:muya/app/theme/app_text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/create_resume_controller.dart';

class CreateResumeView extends GetView<CreateResumeController> {
  const CreateResumeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteOff,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF6A5B92)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Create Resume',
          style: AppTextStyles.titleBold.copyWith(
            color: AppColors.grayDefault,
            fontSize: AppSizes.font_16,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //    Large preview
              Obx(
                () => Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 8,
                  ),
                  child: AspectRatio(
                    aspectRatio: 3 / 4,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 16,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                          controller.templates[controller
                              .selectedIndex
                              .value]['image']!,
                          fit: BoxFit.contain,
                          errorBuilder:
                              (context, error, stackTrace) => Center(
                                child: Icon(
                                  Icons.broken_image,
                                  size: 48,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              // Choose a Template label
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Choose a Template',
                    style: AppTextStyles.titleRegular.copyWith(
                      color: AppColors.grayDefault,
                      fontSize: AppSizes.font_18,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              // Horizontal list of templates
              Obx(
                () => SizedBox(
                  height: 20.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: controller.templates.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 16),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => controller.selectedIndex.value = index,
                        child: Column(
                          children: [
                            Obx(
                              () => Container(
                                width: 12.h,
                                height: 17.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border:
                                      index == controller.selectedIndex.value
                                          ? Border.all(
                                            color: AppColors.primary,
                                            width: 2,
                                          )
                                          : null,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.04),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    controller.templates[index]['image']!,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) => Center(
                                          child: Icon(
                                            Icons.broken_image,
                                            size: 32,
                                            color: Colors.grey.shade300,
                                          ),
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            SizedBox(
                              width: 70,
                              child: Text(
                                controller.templates[index]['name']!,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.bodySmallRegular.copyWith(
                                  fontSize: AppSizes.font_12,
                                  fontWeight:
                                      index == controller.selectedIndex.value
                                          ? FontWeight.w600
                                          : FontWeight.w400,
                                  color:
                                      index == controller.selectedIndex.value
                                          ? AppColors.grayDefault
                                          : AppColors.grayDefault,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
        child: SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 0,
            ),
            onPressed: () {
              Get.to(() => const CreateResumeFormView());
            },
            child: const Text(
              'Create Resume',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
