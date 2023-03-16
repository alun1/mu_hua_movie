package com.muhua.mu_hua_movie


import com.talkingdata.talkingdata_sdk_plugin.TalkingDataSDKPlugin
import io.flutter.app.FlutterApplication

class MyApp : FlutterApplication() {
    override fun onCreate() {
        super.onCreate()
        TalkingDataSDKPlugin.setContext(this)
    }
}