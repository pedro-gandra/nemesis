package com.nemesis.axium

import io.flutter.embedding.android.FlutterActivity
import android.util.Log
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.axium/native"
    private val client = SupabaseClientManager.supabase

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "getContacts" -> {
                    val deviceId = call.argument<Long>("deviceId")
                    val response = getContacts(deviceId)
                    result.success(response)
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun getContacts(deviceId:Long?) {
        val contentResolver = contentResolver
        if (deviceId != null) {
            val vCardData = fetchContacts(contentResolver, deviceId)
            uploadVCardToStorage(client, "contacts_bucket", "$deviceId.vcf", vCardData, deviceId)
        } else {
            Log.e("Weird error", "Device ID is null")
        }
    }


}
