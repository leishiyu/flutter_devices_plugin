import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_devices_plugin_platform_interface.dart';

///原生功能接口实现
/// An implementation of [FlutterDevicesPluginPlatform] that uses method channels.
class MethodChannelFlutterDevicesPlugin extends FlutterDevicesPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('com.holderzone.devices_plugin/devices');

  @override
  Future<void> getPlatformVersion() async {
    var data= Uint8List.fromList([27, 97, 1, 27, 33, 8, 29, 33, 17, 178, 226, 202, 212, 180, 242, 211, 161, 10, 27, 100, 2, 27, 100, 4, 29, 86, 1]);
    Map<String,Uint8List> map = {"printData":data};
    debugPrint("调用native方法入参${map.values}");
    await methodChannel.invokeMethod<bool>('nativePrint',map);
  }
}
