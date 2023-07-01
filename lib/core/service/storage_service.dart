import 'dart:developer';
import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constant.dart';

class StorageService {
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setString(String key, String? value) async {
    return await _prefs.setString(key, value ?? "");
  }

  Future<bool> setInt(String key, int? value) async {
    return await _prefs.setInt(key, value ?? 0);
  }

  int getProductId() => _prefs.getInt(AppConstants.STORAGE_PRODUCT_ID_KEY) ?? 0;


  bool getIsLoggedIn() {
    return (_prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY) == "" ||
        _prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY) == null)
        ? false
        : true;
  }

  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }

  String getUserToken() {
    return _prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY) ?? "";
  }
}
