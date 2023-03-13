package com.muhua.mu_hua_movie

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "native_channel"
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "installApk" -> {
                    InstallUtil().installApk(this, call.arguments as String, 10001)
                }
            }

        }

    }
}
