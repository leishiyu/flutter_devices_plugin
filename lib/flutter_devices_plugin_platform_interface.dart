import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_devices_plugin_method_channel.dart';


/// 功能接口定义
abstract class FlutterDevicesPluginPlatform extends PlatformInterface {
  /// Constructs a FlutterDevicesPluginPlatform.
  FlutterDevicesPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterDevicesPluginPlatform _instance = MethodChannelFlutterDevicesPlugin();

  /// The default instance of [FlutterDevicesPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterDevicesPlugin].
  static FlutterDevicesPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterDevicesPluginPlatform] when
  /// they register themselves.
  static set instance(FlutterDevicesPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
