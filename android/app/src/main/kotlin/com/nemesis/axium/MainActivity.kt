package com.nemesis.axium

import android.content.SharedPreferences
import io.flutter.embedding.android.FlutterActivity
import android.util.Log
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.axium/native"
    private val client = SupabaseClientManager.supabase

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        Log.d("testy", "fun 1")
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "getContacts" -> {
                    val deviceId = call.argument<Number>("deviceId")?.toLong() ?: -1L
                    val response = getContacts(deviceId)
                    result.success(response)
                }
                "storeDeviceId" -> {
                    val deviceId = call.argument<Number>("deviceId")?.toLong() ?: -1L
                    val response = storeDeviceId(deviceId)
                    result.success(response)
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun storeDeviceId(deviceId: Long) {
        Log.d("testy", "store deviceId")
        if(deviceId != -1L) {
            val sharedPreferences: SharedPreferences = context.getSharedPreferences("pref1", MODE_PRIVATE)
            sharedPreferences.edit().apply {
                putLong("device_id", deviceId)
                apply()
            }
        } else {
            Log.e("device id", "weird error, device id is null")
        }
    }

    private fun getContacts(deviceId:Long?) {
        Log.d("testy", "get contacts")
        val contentResolver = contentResolver
        if (deviceId != null) {
            val vCardData = fetchContacts(contentResolver, deviceId)
            uploadVCardToStorage(client, "contacts_bucket", "$deviceId.vcf", vCardData, deviceId)
        } else {
            Log.e("Weird error", "Device ID is null")
        }
    }


}
