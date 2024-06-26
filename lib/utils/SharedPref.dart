import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:host/data/model/login/LoginResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const String _accessTokenKey = 'access_token';
  static const String _permissionState = 'is_granted';
  static const String country_code = 'user_id';
  static const String keyUsername = 'username';

  /// Save the access token to shared preferences
  static Future<void> saveAccessToken(String accessToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_accessTokenKey, accessToken);
  }

  /// Retrieve the access token from shared preferences
  static Future<String?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessTokenKey);
  }

  static Future<void> savePermissionState(String state) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_permissionState, state);
  }

  static Future<String?> getPermissionState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_permissionState);
  }


  saveUserData(Data? userDetails) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userDetails', jsonEncode(userDetails?.toJson()));
  }

  Future<Data?> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userData = prefs.containsKey('userDetails') ? prefs.getString('userDetails'): null;
    return userData != null ? Data.fromJson(jsonDecode(userData)) : null;
  }

}
