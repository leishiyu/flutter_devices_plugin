#include "include/flutter_devices_plugin/flutter_devices_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_devices_plugin.h"

void FlutterDevicesPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_devices_plugin::FlutterDevicesPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
