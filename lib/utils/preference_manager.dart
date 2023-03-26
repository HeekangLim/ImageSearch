import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  // PreferenceManager(this._sharedPreferences);

  static SharedPreferences? _sharedPreferences;

  static Future<SharedPreferences?> initialize () async{
    _sharedPreferences ??= await SharedPreferences.getInstance();
    return _sharedPreferences;
  }

  SharedPreferences? get() => _sharedPreferences;

  void setBool(String key, bool value) {
    _sharedPreferences?.setBool(key, value);
  }

  void setInt(String key, int value) {
    _sharedPreferences?.setInt(key, value);
  }

  void setDouble(String key, double value) {
    _sharedPreferences?.setDouble(key, value);
  }

  void setString(String key, String value) {
    _sharedPreferences?.setString(key, value);
  }

  void setDynamic(String key, dynamic value) {
    if (value is String) {
      setString(key, value);
    }
    else if (value is bool) {
      setBool(key, value);
    }
    else if (value is int) {
      setInt(key, value);
    }
    else if (value is double) {
      setDouble(key, value);
    }
    else {
      throw const PreferenceException(message: 'value parsing failed');
    }
  }

  bool getBool(String key, bool defValue) {
    return _sharedPreferences?.getBool(key) ?? defValue;
  }

  int getInt(String key, int defValue) {
    return _sharedPreferences?.getInt(key) ?? defValue;
  }

  double getDouble(String key, double defValue) {
    return _sharedPreferences?.getDouble(key) ?? defValue;
  }

  String getString(String key, String defValue) {
    return _sharedPreferences?.getString(key) ?? defValue;
  }
}

class PreferenceException implements Exception {
  /// Creates a new [PreferenceParcingException].
  const PreferenceException({required this.message});

  /// Description of the problem.
  final String message;
}
