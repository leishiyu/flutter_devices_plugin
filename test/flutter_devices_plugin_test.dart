import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_devices_plugin/flutter_devices_plugin.dart';
import 'package:flutter_devices_plugin/flutter_devices_plugin_platform_interface.dart';
import 'package:flutter_devices_plugin/flutter_devices_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterDevicesPluginPlatform
    with MockPlatformInterfaceMixin
    implements FlutterDevicesPluginPlatform {

  @override
  Future<void> getPlatformVersion() => Future.value();
}

void main() {
  final FlutterDevicesPluginPlatform initialPlatform = FlutterDevicesPluginPlatform.instance;

  test('$MethodChannelFlutterDevicesPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterDevicesPlugin>());
  });

  test('getPlatformVersion', () async {
    FlutterDevicesPlugin flutterDevicesPlugin = FlutterDevicesPlugin();
    MockFlutterDevicesPluginPlatform fakePlatform = MockFlutterDevicesPluginPlatform();
    FlutterDevicesPluginPlatform.instance = fakePlatform;

  });
}
