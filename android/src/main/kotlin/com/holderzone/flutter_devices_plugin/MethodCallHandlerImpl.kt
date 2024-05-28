package com.holderzone.flutter_devices_plugin

import android.app.ActivityManager
import android.content.Context
import android.content.pm.PackageManager
import android.util.Log
import com.holderzone.flutter_devices_plugin.print.LocalBankPrinter
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import java.util.Arrays

/**
 * @author Created by leisiyu
 * @email: 2630940292@qq.com
 * @Date: 2024/5/20
 * @Project: com.holderzone.flutter_devices_plugin
 * @Description: Plugin方法处理器实现
 * @Version:
 */
class MethodCallHandlerImpl(
    private val packageManager: PackageManager,
    private val activityManager: ActivityManager,
    private val context: Context
) :MethodCallHandler {
    override fun onMethodCall(p0: MethodCall, p1: MethodChannel.Result) {
        Log.d("MethodCallHandlerImpl","方法名：${p0.method} 参数：${p0.arguments}")
        when{
            //调用原生平台打印方法
            p0.method == "nativePrint" ->{
                Log.d("MethodCallHandlerImpl","调用原生平台打印方法")
                val a = p0.argument<ByteArray>("printData")
                a?.let {
                    Log.d("PrintData", it.contentToString())
                }
                requireNotNull(a)
                try {
                    val localBankPrinter = LocalBankPrinter(context)
                    localBankPrinter.print(a)
                    p1.success(true)
                } catch (e: Exception) {
                    Log.d("MethodCallHandlerImpl",e.message.toString())
                    p1.error("nativePrint", e.message, e)
                }
            }
        }
    }
}