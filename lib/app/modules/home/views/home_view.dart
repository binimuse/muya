import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:muya/app/common/app_toasts.dart';
import 'package:muya/app/routes/app_pages.dart';
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
          _buildBackground(),
          Column(children: [_buildHeaderAndCarousel(), _buildLibrarySection()]),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFE6E0F8), Color(0xFFB8AEE0)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  Widget _buildHeaderAndCarousel() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 4.h),
          Obx(() {
            final name = controller.userName.value;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello ${name.isNotEmpty ? name : 'User'} 👋',
                      style: AppTextStyles.titleBold.copyWith(
                        color: AppColors.grayDefault,
                        fontSize: AppSizes.font_22,
                      ),
                    ),
                    if (name.isEmpty) ...[
                      _debugText('First Name: ${controller.firstName.value}'),
                      _debugText('Last Name: ${controller.lastName.value}'),
                      _debugText('Username: ${controller.username.value}'),
                    ],
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz, color: Color(0xFF6A5B92)),
                  onPressed: () {},
                ),
              ],
            );
          }),
          const SizedBox(height: 24),
          SizedBox(
            height: 120, // Carousel visible area
            child: CarouselSlider.builder(
              itemCount: controller.resumeSlides.length,
              options: CarouselOptions(
                height: 120,
                viewportFraction: 1.0,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.easeInOut,
                scrollDirection: Axis.vertical,
              ),
              itemBuilder: (context, index, realIdx) {
                final slide = controller.resumeSlides[index];
                return _buildResumeCard(slide);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _debugText(String text) {
    return Text(
      text,
      style: AppTextStyles.bodySmallRegular.copyWith(
        color: Colors.red,
        fontSize: AppSizes.font_12,
      ),
    );
  }

  Widget _buildResumeCard(Map<String, String> slide) {
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
              Get.toNamed(Routes.CREATE_RESUME);
            } else if (slide['title'] == 'Write Job Description') {
              Get.toNamed(Routes.WRITE_JOB_DESCRIPTION);
            } else if (slide['title'] == 'Write Cover Letter') {
              Get.toNamed(Routes.WRITE_COVER_LETTER);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            child: Row(
              children: [
                _iconContainer(),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        slide['title']!,
                        style: AppTextStyles.titleRegular.copyWith(
                          color: AppColors.black,
                          fontSize: AppSizes.font_16,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        slide['subtitle']!,
                        style: AppTextStyles.bodySmallRegular.copyWith(
                          color: AppColors.grayDefault,
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
  }

  Widget _iconContainer() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(
        Icons.description_outlined,
        color: Color(0xFF6A5B92),
        size: 36,
      ),
    );
  }

  Widget _buildLibrarySection() {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
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
              _libraryHeader(),
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
                    children:
                        controller.templates
                            .map((name) => _buildTemplateItem(name))
                            .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _libraryHeader() {
    return Row(
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
          icon: const Icon(Icons.edit, color: Color(0xFF6A5B92)),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildTemplateItem(String name) {
    final imagePath = _getImageForTemplate(name);
    return GestureDetector(
      onTap: () => _showTemplateDialog(name, imagePath),
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
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) => Icon(
                        Icons.broken_image,
                        size: 32,
                        color: Colors.grey.shade300,
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

  String _getImageForTemplate(String name) {
    switch (name) {
      case 'Sapphire':
        return Assets.images.cv3.path;
      case 'Amber':
        return Assets.images.cv4.path;
      case 'Topaz':
        return Assets.images.cv1.path;
      case 'Onyx':
        return Assets.images.cv5.path;
      default:
        return Assets.images.cv4.path;
    }
  }

  void _showTemplateDialog(String name, String imagePath) {
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
                      imagePath,
                      fit: BoxFit.contain,
                      errorBuilder:
                          (context, error, stackTrace) => Icon(
                            Icons.broken_image,
                            size: 48,
                            color: Colors.grey.shade300,
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
  }
}
