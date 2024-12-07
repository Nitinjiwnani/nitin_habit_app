import 'package:flutter/services.dart';

class Toast {
  static const _channel = MethodChannel('com.example.nitin_habit_app/toast');

  static Future<void> showToast(String message) async {
    try {
      await _channel.invokeMethod('showToast', {'message': message});
    } catch (e) {
      print('Error showing toast: $e');
    }
  }
}
