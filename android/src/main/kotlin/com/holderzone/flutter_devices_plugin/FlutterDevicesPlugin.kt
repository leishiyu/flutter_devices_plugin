package com.holderzone.flutter_devices_plugin

import android.app.ActivityManager
import android.content.Context
import android.content.pm.PackageManager

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel

/** FlutterDevicesPlugin */
class FlutterDevicesPlugin: FlutterPlugin {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    setupMethodChannel(flutterPluginBinding.binaryMessenger, flutterPluginBinding.applicationContext)
  }

  private fun setupMethodChannel(messenger: BinaryMessenger, context: Context) {
    channel = MethodChannel(messenger, "com.holderzone.devices_plugin/devices")
    val packageManager: PackageManager = context.packageManager
    val activityManager: ActivityManager = context.getSystemService(Context.ACTIVITY_SERVICE) as ActivityManager
    val handler = MethodCallHandlerImpl(packageManager, activityManager,context)
    channel.setMethodCallHandler(handler)
  }
  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
