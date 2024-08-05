import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class RequestInterceptor {

  static Future<Map<String, String>> getHeaders() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('authToken');

    final Map<String, String> headers = <String, String>{
      "Content-Type": "application/json",
      "Accept-Type": "application/json",
      if (token != null) "Authorization": "Bearer $token",
    };

    debugPrint("Headers - ${headers.keys} : ${headers.values}");
    return headers;
  }

}
