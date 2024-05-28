#ifndef FLUTTER_PLUGIN_FLUTTER_DEVICES_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTER_DEVICES_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutter_devices_plugin {

class FlutterDevicesPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FlutterDevicesPlugin();

  virtual ~FlutterDevicesPlugin();

  // Disallow copy and assign.
  FlutterDevicesPlugin(const FlutterDevicesPlugin&) = delete;
  FlutterDevicesPlugin& operator=(const FlutterDevicesPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutter_devices_plugin

#endif  // FLUTTER_PLUGIN_FLUTTER_DEVICES_PLUGIN_H_
