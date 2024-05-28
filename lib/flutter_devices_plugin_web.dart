// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'flutter_devices_plugin_platform_interface.dart';

///web功能接口实现
/// A web implementation of the FlutterDevicesPluginPlatform of the FlutterDevicesPlugin plugin.
class FlutterDevicesPluginWeb extends FlutterDevicesPluginPlatform {
  /// Constructs a FlutterDevicesPluginWeb
  FlutterDevicesPluginWeb();

  static void registerWith(Registrar registrar) {
    FlutterDevicesPluginPlatform.instance = FlutterDevicesPluginWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<void> getPlatformVersion() async {
    final version = html.window.navigator.userAgent;
  }
}
