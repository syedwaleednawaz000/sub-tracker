import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sub_tracker/Provider/profile_provider.dart';
import 'package:sub_tracker/utils/app_constant.dart';
import 'package:sub_tracker/utils/app_url.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';


class APIClient {
  late final prefs =  SharedPreferences.getInstance();
  Dio _dio = Dio();
  Map<String, dynamic> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${AppConstant.getUserToken}'
  };

  APIClient() {
    BaseOptions baseOptions = BaseOptions(
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
      baseUrl: AppUrl.baseUrl,
      maxRedirects: 2,
    );
    _dio = Dio(baseOptions);
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      error: true,
      request: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
  }

  /// for Get request.
  Future<Response> get({required String url,}) async {
    print("this is header ${headers}");
    try {
      final response = await _dio.get(
        url,
        options: Options(
          responseType: ResponseType.json,
          headers: headers,
        ),
      );
      return response;
    } on DioError catch (error) {
      if(error.response!.statusCode == 401){
        Provider.of<ProfileProvider>(Get.context!,listen: false).cleanLocalData(context: Get.context!);
      }
      String content = error.response?.toString() ?? "Error occurred without a response.";
      // Handle error or log content if needed
      rethrow;
    }
  }

  /// for Post request.
  Future<Response> post({required String url, dynamic params,}) async {
    try {
      final response = await _dio.post(
        url,
        data: params,
        options: Options(
          responseType: ResponseType.json,
          headers: headers,
        ),
      );
      return response;
    } on DioException catch (error) {
      print("error in post ${error}");
      if (error.response != null) {

        String content = error.response.toString();
        Map<String, dynamic> map = jsonDecode(error.response.toString());
        if(map['message'] == null){
          FlutterToast.toastMessage(message: map['error'],isError: true);
          print("This is an error in Dio: ${map['error'].toString()}");
        }else{
          FlutterToast.toastMessage(message: map['message'],isError: true);
          print("This is an error in Dio: ${map['message'].toString()}");
        }

      }
      rethrow;
    }
  }

  /// for delete request
  Future<Response> delete({required String url, dynamic params,}) async {
    try {
      final response = await _dio.delete(
        url,
        data: params,
        options: Options(
          responseType: ResponseType.json,
          headers: headers,
        ),
      );
      return response;
    } on DioException catch (error) {
      if (error.response != null) {
        String content = error.response.toString();
        Map<String, dynamic> map = jsonDecode(error.response.toString());
        // AppConstants.flutterToast(message: map['message']);
        print("This is an error in Dio: ${map['message'].toString()}");
        print("This is an error in Dio, complete map in delete method: ${error.response!.statusCode.toString()}");
      }
      rethrow;
    }
  }
  // patch
  Future<Response> patch({required String url, dynamic params,}) async {
    try {
      final response = await _dio.patch(
        url,
        data: params,
        options: Options(
          responseType: ResponseType.json,
          headers: headers,
        ),
      );
      return response;
    } on DioException catch (error) {
      if (error.response != null) {
        String content = error.response.toString();
        Map<String, dynamic> map = jsonDecode(error.response.toString());
        // AppConstants.flutterToast(message: map['message']);
        print("This is an error in Dio: ${map['message'].toString()}");
        print("This is an error in Dio, complete map in delete method: ${error.response!.statusCode.toString()}");
      }
      rethrow;
    }
  }
  /// for Put Request.
  Future<Response> put({required String url, dynamic params,}) async {
    try {
      final response = await _dio.put(
        url,
        data: params,
        options: Options(
          responseType: ResponseType.json,
        ),
      );
      return response;
    } on DioException catch (error) {
      if (error.response != null) {
        String content = error.response.toString();
        print("This is status code: ${error.response!.statusCode}");
        Map<String, dynamic> map = error.response!.data;
        // AppConstants.flutterToast(message: map['message']);
      }
      rethrow;
    }
  }

  /// for download Request.
  Future<Response> download(String url, String pathName, void Function(int, int)? onReceiveProgress) async {
    // logger.i("${AppConstant.getUserToken}this is my user token");
    Response response;
    try {
      response = await _dio.download(
        url,
        pathName,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (error) {
      String content = error.response.toString();
      // AppConstant.logger
      //     .e("This is an error in Dio API client: ${content.toString()}");
      rethrow;
    }
    return response;
  }
}