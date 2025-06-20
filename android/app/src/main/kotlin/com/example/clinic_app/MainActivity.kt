package com.example.clinic_app

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity(){
     override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Notifications.createNotificationChannels(this)
    }
}