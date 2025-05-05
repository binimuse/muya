import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WriteCoverLetterController extends GetxController {
  final messageController = TextEditingController();
  final messages = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Add initial welcome message
    messages.add({
      'text':
          'Hello! I can help you write a cover letter. Please describe the job you\'re applying for and share your relevant experience, skills, and achievements that make you a strong candidate.',
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
            'I\'ll help you write a cover letter based on your input. Here\'s a draft:\n\n'
            '[Your Name]\n'
            '[Your Address]\n'
            '[City, State ZIP]\n'
            '[Date]\n\n'
            '[Hiring Manager\'s Name]\n'
            '[Company Name]\n'
            '[Company Address]\n'
            '[City, State ZIP]\n\n'
            'Dear [Hiring Manager\'s Name],\n\n'
            '[Opening paragraph introducing yourself and the position]\n\n'
            '[Body paragraphs highlighting your relevant experience and achievements]\n\n'
            '[Closing paragraph expressing enthusiasm and requesting an interview]\n\n'
            'Sincerely,\n'
            '[Your Name]\n\n'
            'Would you like me to modify any part of this cover letter?',
        'isUser': false,
      });
    });
  }
}
