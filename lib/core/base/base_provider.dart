import 'package:flutter/material.dart';
import "package:get/get_connect/connect.dart";
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_instance/src/lifecycle.dart';
import 'package:job_portal/core/constant/endpoints.dart';
import 'package:job_portal/core/network/request_interceptor.dart';



class BaseProvider extends GetConnect {

  // Injecting Instance
  @override
  InternalFinalCallback<void> get onStart {
    debugPrint("BaseProviderOnStart");
    httpClient.baseUrl = Endpoints.baseUrl;
    httpClient.addRequestModifier((Request<dynamic> request) {
      debugPrint("${request.url}, Headers - ${request.headers.keys} : ${request.headers.values}");
      return request;
    });
    return super.onStart;
  }

  Future<Map<String, String>> _getHeaders() async {
    return await RequestInterceptor.getHeaders();
  }


  // Get:-----------------------------------------------------------------------
  @override
  Future<Response<T>> get<T>(String url, {Map<String, String>? headers, String? contentType, Map<String, dynamic>? query, Decoder<T>? decoder}) async {
    Map<String, dynamic>? queries = query;
    queries ??= <String, dynamic>{};
    queries.forEach((String key, dynamic value) {
      queries![key] = value.toString();
    });
    headers = await _getHeaders();
    return super.get(
      url,
      headers: headers ,
      contentType: contentType,
      query: queries,
      decoder: decoder,
    );
  }


  // Post:----------------------------------------------------------------------
  @override
  Future<Response<T>> post<T>(String? url, dynamic body, {String? contentType, Map<String, String>? headers, Map<String, dynamic>? query, Decoder<T>? decoder, Progress? uploadProgress}) async {
    Map<String, dynamic>? queries = query;
    queries ??= <String, dynamic>{};
    queries.forEach((String key, dynamic value) {
      queries![key] = value.toString();
    });
    headers = await _getHeaders();
    return super.post(
      url,
      body,
      contentType: contentType,
      headers: headers ,
      query: queries,
      decoder: decoder,
      uploadProgress: uploadProgress,
    );
  }


  // Put:-----------------------------------------------------------------------
  @override
  Future<Response<T>> put<T>(String url, dynamic body, {String? contentType, Map<String, String>? headers, Map<String, dynamic>? query, Decoder<T>? decoder, Progress? uploadProgress}) async {
    Map<String, dynamic>? queries = query;
    queries ??= <String, dynamic>{};
    queries.forEach((String key, dynamic value) {
      queries![key] = value.toString();
    });
    headers = await _getHeaders();
    return super.put(
      url,
      body,
      contentType: contentType,
      headers: headers ,
      query: queries,
      decoder: decoder,
      uploadProgress: uploadProgress,
    );
  }


  // Delete:--------------------------------------------------------------------
  @override
  Future<Response<T>> delete<T>(String url, {Map<String, String>? headers, String? contentType, Map<String, dynamic>? query, Decoder<T>? decoder}) async {
    Map<String, dynamic>? queries = query;
    queries ??= <String, dynamic>{};
    queries.forEach((String key, dynamic value) {
      queries![key] = value.toString();
    });
    headers = await _getHeaders();
    return super.delete(
      url,
      headers: headers ,
      contentType: contentType,
      query: queries,
      decoder: decoder,
    );
  }
}
