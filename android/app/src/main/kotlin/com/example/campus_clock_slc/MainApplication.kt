package com.example.campus_clock_slc

import io.flutter.app.FlutterApplication
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback
import io.flutter.plugins.GeneratedPluginRegistrant

class MainApplication : FlutterApplication(), PluginRegistrantCallback {
    override fun onCreate() {
        super.onCreate()
    }

    override fun registerWith(registry: PluginRegistry?) {
        if (registry != null) {
            GeneratedPluginRegistrant.registerWith(registry)
        }
    }
}
