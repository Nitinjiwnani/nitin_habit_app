package com.example.nitin_habit_app

import android.os.Bundle
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.nitin_habit_app/toast"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "showToast") {
val message = call.argument<String>("message") ?: "Default message"
Toast.makeText(applicationContext, message, Toast.LENGTH_SHORT).show()
                result.success(null)
            } else {
                result.notImplemented()
            }
        }
    }
}
