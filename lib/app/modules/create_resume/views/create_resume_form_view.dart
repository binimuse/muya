import 'package:flutter/material.dart';
import 'package:muya/app/theme/app_colors.dart';
import 'package:muya/app/theme/app_sizes.dart';
import 'package:muya/app/theme/app_text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import '../controllers/create_resume_controller.dart';
import '../views/payment_view.dart';

class CreateResumeFormView extends StatelessWidget {
  const CreateResumeFormView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateResumeController>();
    // Local controllers for static fields
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final jobTitleController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    final websiteController = TextEditingController();
    final addressController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.whiteOff,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF6A5B92)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Resume Form',
          style: AppTextStyles.titleBold.copyWith(
            color: AppColors.grayDefault,
            fontSize: AppSizes.font_16,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // About You Card
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.whiteOff,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 12,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person_outline, color: Color(0xFF6A5B92)),
                        SizedBox(width: 8),
                        Text(
                          'About You',
                          style: AppTextStyles.titleBold.copyWith(
                            color: AppColors.grayDefault,
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.expand_less, color: AppColors.grayDefault),
                      ],
                    ),
                    SizedBox(height: 18),
                    // Add Photo
                    Center(
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: AppColors.white30,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: AppColors.white30,
                                width: 2,
                              ),
                            ),
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 40,
                              color: Color(0xFFB0AFC6),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Add Photo',
                            style: TextStyle(
                              color: Color(0xFF6A5B92),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    // Form fields
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            'First name',
                            'Enter first name',
                            firstNameController,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: _buildTextField(
                            'Last name',
                            'Enter last Name',
                            lastNameController,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    _buildTextField(
                      'Job title',
                      'Enter job title',
                      jobTitleController,
                    ),
                    SizedBox(height: 12),
                    _buildTextField('Email', 'Enter email', emailController),
                    SizedBox(height: 12),
                    _buildTextField(
                      'Phone number',
                      'Enter phone number',
                      phoneController,
                    ),
                    SizedBox(height: 12),
                    _buildTextField(
                      'Website',
                      'Enter website',
                      websiteController,
                    ),
                    SizedBox(height: 12),
                    _buildTextField(
                      'Address',
                      'Enter address',
                      addressController,
                    ),
                    // --- Education Section inside the card ---
                    SizedBox(height: 24),
                    Obx(
                      () => Column(
                        children: [
                          for (int i = 0; i < controller.educations.length; i++)
                            Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 16),
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 8,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'School #${i + 1}',
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                            onPressed:
                                                () => controller.educations
                                                    .removeAt(i),
                                            tooltip: 'Delete this school',
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      _buildTextField(
                                        'School',
                                        'Enter school',
                                        controller
                                            .educations[i]['schoolController'],
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: _buildTextField(
                                              'Start date',
                                              'Enter start date',
                                              controller
                                                  .educations[i]['startDateController'],
                                            ),
                                          ),
                                          SizedBox(width: 12),
                                          Expanded(
                                            child: _buildTextField(
                                              'End date',
                                              'Enter end date',
                                              controller
                                                  .educations[i]['endDateController'],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      _buildDropdownField(
                                        'Field of study',
                                        [
                                          'Computer Science',
                                          'Business',
                                          'Engineering',
                                          'Medicine',
                                          'Law',
                                        ],
                                        controller.educations[i],
                                        'fieldValue',
                                      ),
                                      SizedBox(height: 8),
                                      _buildTextField(
                                        'Description',
                                        'Enter description',
                                        controller
                                            .educations[i]['descController'],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          OutlinedButton.icon(
                            onPressed:
                                controller.educations.length < 10
                                    ? () => _addEducation(controller)
                                    : null,
                            icon: Icon(Icons.add, color: Colors.deepPurple),
                            label: Text(
                              '+ Add Education',
                              style: TextStyle(color: Colors.deepPurple),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                color: Colors.deepPurple.shade100,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              minimumSize: Size(double.infinity, 48),
                              backgroundColor: Colors.deepPurple.shade50
                                  .withOpacity(0.1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // --- Work Experience Section ---
                    SizedBox(height: 24),
                    Text(
                      'Work Experience',
                      style: AppTextStyles.titleBold.copyWith(
                        color: AppColors.grayDefault,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 12),
                    Obx(
                      () => Column(
                        children: [
                          for (
                            int i = 0;
                            i < controller.workExperiences.length;
                            i++
                          )
                            Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 16),
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 8,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Experience #${i + 1}',
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                            onPressed:
                                                () => controller.workExperiences
                                                    .removeAt(i),
                                            tooltip: 'Delete this experience',
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      _buildTextField(
                                        'Company',
                                        'Enter company name',
                                        controller
                                            .workExperiences[i]['companyController'],
                                      ),
                                      SizedBox(height: 8),
                                      _buildTextField(
                                        'Position',
                                        'Enter position',
                                        controller
                                            .workExperiences[i]['positionController'],
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: _buildTextField(
                                              'Start date',
                                              'Enter start date',
                                              controller
                                                  .workExperiences[i]['startDateController'],
                                            ),
                                          ),
                                          SizedBox(width: 12),
                                          Expanded(
                                            child: _buildTextField(
                                              'End date',
                                              'Enter end date',
                                              controller
                                                  .workExperiences[i]['endDateController'],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      _buildTextField(
                                        'Description',
                                        'Enter job description',
                                        controller
                                            .workExperiences[i]['descController'],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          OutlinedButton.icon(
                            onPressed:
                                controller.workExperiences.length < 10
                                    ? () => _addWorkExperience(controller)
                                    : null,
                            icon: Icon(Icons.add, color: Colors.deepPurple),
                            label: Text(
                              '+ Add Work Experience',
                              style: TextStyle(color: Colors.deepPurple),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                color: Colors.deepPurple.shade100,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              minimumSize: Size(double.infinity, 48),
                              backgroundColor: Colors.deepPurple.shade50
                                  .withOpacity(0.1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // --- Skills Section ---
                    SizedBox(height: 24),
                    Text(
                      'Skills',
                      style: AppTextStyles.titleBold.copyWith(
                        color: AppColors.grayDefault,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 12),
                    Obx(
                      () => Column(
                        children: [
                          for (int i = 0; i < controller.skills.length; i++)
                            Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 16),
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 8,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Skill #${i + 1}',
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                            onPressed:
                                                () => controller.skills
                                                    .removeAt(i),
                                            tooltip: 'Delete this skill',
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      _buildDropdownField(
                                        'Category',
                                        controller.skillCategories,
                                        controller.skills[i],
                                        'categoryValue',
                                      ),
                                      SizedBox(height: 8),
                                      _buildTextField(
                                        'Skill',
                                        'Enter skill',
                                        controller.skills[i]['skillController'],
                                      ),
                                      SizedBox(height: 8),
                                      _buildTextField(
                                        'Level',
                                        'Enter proficiency level',
                                        controller.skills[i]['levelController'],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          OutlinedButton.icon(
                            onPressed:
                                controller.skills.length < 20
                                    ? () => _addSkill(controller)
                                    : null,
                            icon: Icon(Icons.add, color: Colors.deepPurple),
                            label: Text(
                              '+ Add Skill',
                              style: TextStyle(color: Colors.deepPurple),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                color: Colors.deepPurple.shade100,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              minimumSize: Size(double.infinity, 48),
                              backgroundColor: Colors.deepPurple.shade50
                                  .withOpacity(0.1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // --- References Section ---
                    SizedBox(height: 24),
                    Text(
                      'References',
                      style: AppTextStyles.titleBold.copyWith(
                        color: AppColors.grayDefault,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 12),
                    Obx(
                      () => Column(
                        children: [
                          for (int i = 0; i < controller.references.length; i++)
                            Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 16),
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 8,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Reference #${i + 1}',
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                            onPressed:
                                                () => controller.references
                                                    .removeAt(i),
                                            tooltip: 'Delete this reference',
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      _buildTextField(
                                        'Name',
                                        'Enter reference name',
                                        controller
                                            .references[i]['nameController'],
                                      ),
                                      SizedBox(height: 8),
                                      _buildTextField(
                                        'Position',
                                        'Enter reference position',
                                        controller
                                            .references[i]['positionController'],
                                      ),
                                      SizedBox(height: 8),
                                      _buildTextField(
                                        'Company',
                                        'Enter company name',
                                        controller
                                            .references[i]['companyController'],
                                      ),
                                      SizedBox(height: 8),
                                      _buildTextField(
                                        'Email',
                                        'Enter email address',
                                        controller
                                            .references[i]['emailController'],
                                      ),
                                      SizedBox(height: 8),
                                      _buildTextField(
                                        'Phone',
                                        'Enter phone number',
                                        controller
                                            .references[i]['phoneController'],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          OutlinedButton.icon(
                            onPressed:
                                controller.references.length < 5
                                    ? () => _addReference(controller)
                                    : null,
                            icon: Icon(Icons.add, color: Colors.deepPurple),
                            label: Text(
                              '+ Add Reference',
                              style: TextStyle(color: Colors.deepPurple),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                color: Colors.deepPurple.shade100,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              minimumSize: Size(double.infinity, 48),
                              backgroundColor: Colors.deepPurple.shade50
                                  .withOpacity(0.1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
              // Navigate to payment page
              Get.to(() => const PaymentView());
            },
            child: const Text(
              'Submit',
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

  void _addEducation(CreateResumeController controller) {
    controller.educations.add({
      'schoolController': TextEditingController(),
      'startDateController': TextEditingController(),
      'endDateController': TextEditingController(),
      'fieldController': TextEditingController(),
      'descController': TextEditingController(),
    });
  }

  void _addWorkExperience(CreateResumeController controller) {
    controller.workExperiences.add({
      'companyController': TextEditingController(),
      'positionController': TextEditingController(),
      'startDateController': TextEditingController(),
      'endDateController': TextEditingController(),
      'descController': TextEditingController(),
    });
  }

  void _addSkill(CreateResumeController controller) {
    controller.skills.add({
      'categoryValue': controller.skillCategories[0],
      'skillController': TextEditingController(),
      'levelController': TextEditingController(),
    });
  }

  void _addReference(CreateResumeController controller) {
    controller.references.add({
      'nameController': TextEditingController(),
      'positionController': TextEditingController(),
      'companyController': TextEditingController(),
      'emailController': TextEditingController(),
      'phoneController': TextEditingController(),
    });
  }

  Widget _buildTextField(
    String label,
    String hint,
    TextEditingController? controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.bodySmallRegular.copyWith(
            color: AppColors.black,
            fontSize: AppSizes.font_14,
          ),
        ),
        SizedBox(height: 4),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyles.bodySmallRegular.copyWith(
              color: Color(0xFFB0AFC6),
              fontSize: AppSizes.font_12,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE0E0E0)),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE0E0E0)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF6A5B92)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField(
    String label,
    List<String> options,
    Map<String, dynamic> eduMap,
    String valueKey,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.bodySmallRegular.copyWith(
            color: AppColors.black,
            fontSize: AppSizes.font_14,
          ),
        ),
        SizedBox(height: 4),
        DropdownButtonFormField<String>(
          value: eduMap[valueKey] as String?,
          items:
              options
                  .map(
                    (e) => DropdownMenuItem<String>(value: e, child: Text(e)),
                  )
                  .toList(),
          onChanged: (val) {
            eduMap[valueKey] = val;
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE0E0E0)),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE0E0E0)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF6A5B92)),
            ),
          ),
          hint: Text(
            'Select field of study',
            style: AppTextStyles.bodySmallRegular.copyWith(
              color: Color(0xFFB0AFC6),
              fontSize: AppSizes.font_12,
            ),
          ),
        ),
      ],
    );
  }
}
