// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:workmanager/workmanager.dart';

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    // Make an HTTP request to update the server
    DateTime now = DateTime.now().toUtc();
    String timestamp = now.toIso8601String();
    final supabase = SupaFlow.client;
    if (inputData != null) {
      final deviceId = inputData['deviceId'];
      await supabase
          .from("devices")
          .update({'lastPing': timestamp}).eq('id', deviceId);
    }
    return Future.value(true);
  });
}

Future<void> scheduleServerUpdate(int deviceId) async {
  // Initialize WorkManager
  await Workmanager().initialize(callbackDispatcher);
  final inputData = Map<String, dynamic>();
  inputData['deviceId'] = deviceId; // Pass your custom argument

  // Register the periodic task
  await Workmanager().registerPeriodicTask(
    "statusUpdateTask", // Unique task name
    "updateServer", // Task tag to identify it
    frequency: Duration(minutes: 15),
    inputData: inputData, // Minimum is 15 minutes
  );
}
