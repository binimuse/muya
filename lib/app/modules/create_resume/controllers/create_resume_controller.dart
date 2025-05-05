import 'package:get/get.dart';
import 'package:muya/gen/assets.gen.dart';
import 'dart:html' as html;
import 'dart:typed_data';
import 'dart:js' as js;

class CreateResumeController extends GetxController {
  var selectedIndex = 0.obs;
  var profilePhoto = Rxn<Uint8List>();

  // Use real internet images for templates
  final RxList<Map<String, String>> templates =
      <Map<String, String>>[
        {'name': 'Garnet', 'image': Assets.images.cv1.path},
        {'name': 'Sapphire', 'image': Assets.images.cv3.path},
        {'name': 'Topaz', 'image': Assets.images.cv1.path},
        {'name': 'Onyx', 'image': Assets.images.cv5.path},
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

  void pickImage() {
    // Check if we're in a Telegram WebApp
    final telegramWebApp = js.context['Telegram']?['WebApp'];
    if (telegramWebApp != null) {
      try {
        // Request file from Telegram
        telegramWebApp.callMethod('showPopup', [
          {
            'title': 'Select Photo',
            'message': 'Choose a photo from your device or take a new one',
            'buttons': [
              {
                'id': 'gallery',
                'type': 'default',
                'text': 'Choose from Gallery',
              },
              {'id': 'camera', 'type': 'default', 'text': 'Take Photo'},
            ],
          },
          (buttonId) {
            if (buttonId == 'gallery') {
              _pickFromGallery();
            } else if (buttonId == 'camera') {
              _takePhoto();
            }
          },
        ]);
      } catch (e) {
        print('Error using Telegram WebApp API: $e');
        // Fallback to regular file picker if Telegram API fails
        _pickFromGallery();
      }
    } else {
      // Fallback for non-Telegram environments
      _pickFromGallery();
    }
  }

  void _pickFromGallery() {
    final input = html.FileUploadInputElement();
    input.accept = 'image/*';
    input.click();

    input.onChange.listen((event) {
      final files = input.files;
      if (files != null && files.isNotEmpty) {
        final file = files[0];
        final reader = html.FileReader();

        reader.onLoadEnd.listen((event) {
          final bytes = reader.result as List<int>;
          profilePhoto.value = Uint8List.fromList(bytes);
        });

        reader.readAsArrayBuffer(file);
      }
    });
  }

  void _takePhoto() {
    // This is a placeholder for camera functionality
    // In a real implementation, you would use the device's camera API
    // For web, this would typically involve using the MediaDevices API
    html.window.navigator.mediaDevices
        ?.getUserMedia({'video': true, 'audio': false})
        .then((stream) {
          // Handle the camera stream
          // This is a simplified example - you would need to implement
          // the actual photo capture logic here
        })
        .catchError((error) {
          print('Error accessing camera: $error');
          // Fallback to gallery if camera access fails
          _pickFromGallery();
        });
  }
}
