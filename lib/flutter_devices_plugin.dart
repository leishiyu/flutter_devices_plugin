
import 'flutter_devices_plugin_platform_interface.dart';

///flutter接口调用类
class FlutterDevicesPlugin {

  ///Android 平台本机打印
  Future<void> nativePrint() {
    return FlutterDevicesPluginPlatform.instance.getPlatformVersion();
  }
}
