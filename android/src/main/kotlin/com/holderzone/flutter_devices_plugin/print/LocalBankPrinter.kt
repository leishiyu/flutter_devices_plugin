package com.holderzone.flutter_devices_plugin.print

import android.content.Context
import android.util.Log
import net.posprinter.IDeviceConnection
import net.posprinter.IPOSListener
import net.posprinter.POSConnect

/**
 * @author Created by leisiyu
 * @email:
 * @Date: 2024/5/20
 * @Project: com.holderzone.flutter_devices_plugin.print
 * @Description:
 * @Version:
 */
class LocalBankPrinter(private var context: Context)  {

    private var curConnect: IDeviceConnection? = null

    fun print(printData: ByteArray) {
        if (curConnect == null) return
        curConnect!!.close()
        val usbNames = POSConnect.getUsbDevices(context)
        Log.d("LocalBankPrinter", "usbNames:$usbNames ${usbNames.isEmpty()}")
        if (usbNames.isEmpty()) return
        Log.d("LocalBankPrinter", "准备连接打印机")
        curConnect!!.connect(usbNames[0]) { code, msg ->
            if (code == POSConnect.CONNECT_SUCCESS) {
                curConnect!!.sendData(printData)
            }
        }

    }
}