import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _reviewReached = prefs.getBool('ff_reviewReached') ?? _reviewReached;
    });
    _safeInit(() {
      _deviceId = prefs.getInt('ff_deviceId') ?? _deviceId;
    });
    _safeInit(() {
      _countryCode = prefs.getString('ff_countryCode') ?? _countryCode;
    });
    _safeInit(() {
      _reviewReached2 = prefs.getBool('ff_reviewReached2') ?? _reviewReached2;
    });
    _safeInit(() {
      _reviewReached3 = prefs.getBool('ff_reviewReached3') ?? _reviewReached3;
    });
    _safeInit(() {
      _signUp = prefs.getBool('ff_signUp') ?? _signUp;
    });
    _safeInit(() {
      _nome = prefs.getString('ff_nome') ?? _nome;
    });
    _safeInit(() {
      _available = prefs.containsKey('ff_available')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_available')!)
          : _available;
    });
    _safeInit(() {
      _consentSms = prefs.getBool('ff_consentSms') ?? _consentSms;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _reviewReached = false;
  bool get reviewReached => _reviewReached;
  set reviewReached(bool value) {
    _reviewReached = value;
    prefs.setBool('ff_reviewReached', value);
  }

  int _deviceId = 0;
  int get deviceId => _deviceId;
  set deviceId(int value) {
    _deviceId = value;
    prefs.setInt('ff_deviceId', value);
  }

  String _countryCode = 'AAA';
  String get countryCode => _countryCode;
  set countryCode(String value) {
    _countryCode = value;
    prefs.setString('ff_countryCode', value);
  }

  bool _reviewReached2 = false;
  bool get reviewReached2 => _reviewReached2;
  set reviewReached2(bool value) {
    _reviewReached2 = value;
    prefs.setBool('ff_reviewReached2', value);
  }

  bool _reviewReached3 = false;
  bool get reviewReached3 => _reviewReached3;
  set reviewReached3(bool value) {
    _reviewReached3 = value;
    prefs.setBool('ff_reviewReached3', value);
  }

  bool _signUp = false;
  bool get signUp => _signUp;
  set signUp(bool value) {
    _signUp = value;
    prefs.setBool('ff_signUp', value);
  }

  String _nome = '';
  String get nome => _nome;
  set nome(String value) {
    _nome = value;
    prefs.setString('ff_nome', value);
  }

  DateTime? _available = DateTime.fromMillisecondsSinceEpoch(1740755160000);
  DateTime? get available => _available;
  set available(DateTime? value) {
    _available = value;
    value != null
        ? prefs.setInt('ff_available', value.millisecondsSinceEpoch)
        : prefs.remove('ff_available');
  }

  bool _consentSms = false;
  bool get consentSms => _consentSms;
  set consentSms(bool value) {
    _consentSms = value;
    prefs.setBool('ff_consentSms', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
