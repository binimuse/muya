import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:muya/app/common/app_toasts.dart';
import 'package:muya/app/theme/app_colors.dart';
import 'package:muya/app/theme/app_sizes.dart';
import 'package:muya/app/theme/app_text_styles.dart';
import 'package:muya/gen/assets.gen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Gradient and pattern background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFE6E0F8), Color(0xFFB8AEE0)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              // Optionally add a pattern image here
              // image: DecorationImage(
              //   image: AssetImage('assets/pattern.png'),
              //   fit: BoxFit.cover,
              //   opacity: 0.05,
              // ),
            ),
          ),
          // Main content
          Column(
            children: [
              // Header + Carousel
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4.h),
                    // Header with greeting and menu
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello ${controller.userName.value.isNotEmpty ? controller.userName.value : 'User'} 👋',
                                style: AppTextStyles.titleBold.copyWith(
                                  color: AppColors.grayDefault,
                                  fontSize: AppSizes.font_22,
                                ),
                              ),
                              // Debug information
                              if (controller.userName.value.isEmpty)
                                Text(
                                  'Debug Info:',
                                  style: AppTextStyles.bodySmallRegular
                                      .copyWith(
                                        color: Colors.red,
                                        fontSize: AppSizes.font_12,
                                      ),
                                ),
                              if (controller.userName.value.isEmpty)
                                Obx(
                                  () => Text(
                                    'First Name: ${controller.firstName.value}',
                                    style: AppTextStyles.bodySmallRegular
                                        .copyWith(
                                          color: Colors.red,
                                          fontSize: AppSizes.font_12,
                                        ),
                                  ),
                                ),
                              if (controller.userName.value.isEmpty)
                                Obx(
                                  () => Text(
                                    'Last Name: ${controller.lastName.value}',
                                    style: AppTextStyles.bodySmallRegular
                                        .copyWith(
                                          color: Colors.red,
                                          fontSize: AppSizes.font_12,
                                        ),
                                  ),
                                ),
                              if (controller.userName.value.isEmpty)
                                Obx(
                                  () => Text(
                                    'Username: ${controller.username.value}',
                                    style: AppTextStyles.bodySmallRegular
                                        .copyWith(
                                          color: Colors.red,
                                          fontSize: AppSizes.font_12,
                                        ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.more_horiz,
                            color: Color(0xFF6A5B92),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Create Resume Carousel (vertical slider with improved card UI)
                    SizedBox(
                      height: 100,
                      child: CarouselSlider.builder(
                        itemCount: controller.resumeSlides.length,
                        options: CarouselOptions(
                          height: 180,
                          viewportFraction: 1.0,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration: const Duration(
                            milliseconds: 800,
                          ),
                          autoPlayCurve: Curves.easeInOut,
                          scrollDirection: Axis.vertical,
                        ),
                        itemBuilder: (context, index, realIdx) {
                          final slide = controller.resumeSlides[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(18),
                                onTap: () {
                                  if (slide['title'] == 'Create Resume') {
                                    Get.toNamed('/create-resume');
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0,
                                    vertical: 12.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF5F5F5),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.description_outlined,
                                          color: Color(0xFF6A5B92),
                                          size: 36,
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              slide['title']!,
                                              style: AppTextStyles.titleRegular
                                                  .copyWith(
                                                    color: AppColors.black,
                                                    fontSize: AppSizes.font_16,
                                                  ),
                                            ),
                                            const SizedBox(height: 6),
                                            Text(
                                              slide['subtitle']!,
                                              style: AppTextStyles
                                                  .bodySmallRegular
                                                  .copyWith(
                                                    color:
                                                        AppColors.grayDefault,
                                                    fontSize: AppSizes.font_12,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward,
                                        color: Color(0xFF6A5B92),
                                        size: 28,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // Expanded white card for Library
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                    // Optional: add shadow for floating effect
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 16,
                        offset: Offset(0, -4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Library',
                              style: AppTextStyles.titleBold.copyWith(
                                color: AppColors.grayDefault,
                                fontSize: AppSizes.font_22,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Color(0xFF6A5B92),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        Expanded(
                          child: SingleChildScrollView(
                            child: GridView.count(
                              crossAxisCount: 3,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              childAspectRatio: 0.6,
                              crossAxisSpacing: 18,
                              mainAxisSpacing: 18,
                              children: [
                                _buildTemplateItem('Sapphire'),
                                _buildTemplateItem('Amber'),
                                _buildTemplateItem('Garnet'),
                                _buildTemplateItem('Topaz'),
                                _buildTemplateItem('Onyx'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTemplateItem(String name) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: Get.context!,
          builder:
              (context) => Dialog(
                backgroundColor: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        child: Image.asset(
                          name == 'Sapphire'
                              ? Assets.images.cv3.path
                              : name == 'Amber'
                              ? Assets.images.cv4.path
                              : name == 'Topaz'
                              ? Assets.images.cv1.path
                              : name == 'Onyx'
                              ? Assets.images.cv5.path
                              : Assets.images.cv4.path,
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
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              name,
                              style: AppTextStyles.titleRegular.copyWith(
                                fontSize: AppSizes.font_18,
                                color: AppColors.grayDefault,
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                              ),
                              onPressed: () {
                                // TODO: Implement download functionality
                                Get.back();
                                AppToasts.showSuccess(
                                  'Template downloaded successfully',
                                );
                              },
                              child: const Text(
                                'Download',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        );
      },
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  name == 'Sapphire'
                      ? Assets.images.cv3.path
                      : name == 'Amber'
                      ? Assets.images.cv4.path
                      : name == 'Topaz'
                      ? Assets.images.cv1.path
                      : name == 'Onyx'
                      ? Assets.images.cv5.path
                      : Assets.images.cv4.path,
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
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
