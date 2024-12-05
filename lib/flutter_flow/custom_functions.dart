import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/supabase/supabase.dart';

String clearPhoneNumber(String str) {
  return str.replaceAll(RegExp(r'[^+\d]'), '');
}

String? getUserCountry() {
  return WidgetsBinding.instance.platformDispatcher.locale.countryCode ?? 'AAA';
}

String getFlagEmoji(String countryCode) {
  return countryCode
      .toUpperCase()
      .codeUnits
      .map((code) => String.fromCharCode(code + 127397))
      .join();
}

String getDialingCode(String countryCode) {
  final Map<String, String> countryDialingCodes = {
    'BR': '+55',
    'DE': '+49',
    'IT': '+39',
    'ES': '+34',
    'GB': '+44',
    'PT': '+351',
    'FR': '+33',
  };

  return countryDialingCodes[countryCode.toUpperCase()] ?? 'N/A';
}

String joinStrings(
  String str1,
  String str2,
) {
  return str1 + '' + str2;
}
