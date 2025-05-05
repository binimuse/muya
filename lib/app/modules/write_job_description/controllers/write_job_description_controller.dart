import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WriteJobDescriptionController extends GetxController {
  final messageController = TextEditingController();
  final messages = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Add initial welcome message
    messages.add({
      'text':
          'Hello! I can help you write a job description. Please describe the job you want to apply for, including the role, requirements, and any specific details you\'d like to include.',
      'isUser': false,
    });
  }

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }

  void sendMessage() {
    final text = messageController.text.trim();
    if (text.isEmpty) return;

    // Add user message
    messages.add({'text': text, 'isUser': true});

    // Clear input
    messageController.clear();

    // Simulate AI response (replace with actual AI integration)
    Future.delayed(const Duration(seconds: 1), () {
      messages.add({
        'text':
            'I\'ll help you write a job description based on your input. Here\'s a draft:\n\n'
            'Job Title: [Based on your input]\n'
            'Location: [Location]\n'
            'Job Type: [Full-time/Part-time/Contract]\n\n'
            'Job Description:\n'
            '[Detailed description based on your input]\n\n'
            'Requirements:\n'
            '[List of requirements]\n\n'
            'Would you like me to modify any part of this description?',
        'isUser': false,
      });
    });
  }
}
