import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muya/gen/assets.gen.dart';

class CreateResumeController extends GetxController {
  var selectedIndex = 0.obs;

  // Use real internet images for templates
  final RxList<Map<String, String>> templates =
      <Map<String, String>>[
        {'name': 'Garnet', 'image': Assets.images.cv1.path},
        {'name': 'Sapphire', 'image': Assets.images.cv2.path},
        {'name': 'Topaz', 'image': Assets.images.cv3.path},
        {'name': 'Onyx', 'image': Assets.images.cv1.path},
        {'name': 'Emerald', 'image': Assets.images.cv4.path},
        {'name': 'Ruby', 'image': Assets.images.cv5.path},
      ].obs;

  final RxList<String> genders = ['Male', 'Female', 'Other'].obs;
  final RxList<String> countries = ['USA', 'UK', 'Germany', 'Ethiopia'].obs;
  final RxList<String> educationLevels =
      ['High School', 'Bachelor', 'Master', 'PhD'].obs;

  final RxList<Map<String, dynamic>> educations = <Map<String, dynamic>>[].obs;

  // New sections
  final RxList<Map<String, dynamic>> workExperiences =
      <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> skills = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> references = <Map<String, dynamic>>[].obs;

  // Skill categories
  final RxList<String> skillCategories =
      ['Technical Skills', 'Soft Skills', 'Languages', 'Certifications'].obs;
}
