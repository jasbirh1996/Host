import 'dart:io';

import 'package:dio/dio.dart';

import '../../utils/SharedPref.dart';
import 'NetworkWrapper.dart';



class NetworkClass {
  Dio? _dio;

  NetworkClass() {
    BaseOptions options = BaseOptions(
      baseUrl: "http://51.112.6.160:3000/",
    );

    _dio = Dio(options);
    _dio?.interceptors
        .add(LogInterceptor(responseBody: true, requestBody: true));

    _dio?.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        // Fluttertoast.showToast(msg: "something went wrong");
        return handler.next(e);
      },
    ));
  }

  Future<Response> getRequestWithPassword(String endpoint, String password,
      {Map<String, dynamic>? headers}) async {
    try {
      Map<String, dynamic> defaultHeaders = {
        'access_token': await SharedPref.getAccessToken(),
        'Content-Type': 'application/json',
        'Password': password, // Include the password in a custom header
      };
      Response response = await _dio!.get(
        endpoint,
        options: Options(headers: headers ?? defaultHeaders),
      );
      print('Response ===> $response');
      return response;
    } on DioException catch (error) {
      if (error.response!.statusCode == 403) {
        throw Exception('Forbidden: ${error.message}');
      } else if (error.response!.statusCode == 500) {
        throw Exception('Internal Server Error: ${error.message}');
      } else {
        throw Exception('Network Error: ${error.message}');
      }
    }
  }




  Future<Response> getRequest(String endpoint,
      {Map<String, dynamic>? headers}) async {
    try {
      Map<String, dynamic> defaultHeaders = {
        'access_token': await SharedPref.getAccessToken(),
        'Content-Type': 'application/json',
      };
      Response response = await _dio!.get(
        endpoint,
        options: Options(headers: headers ?? defaultHeaders),
      );
      print('Response ===> $response');
      return response;
    } on DioException catch (error) {
      if (error.response!.statusCode == 403) {
        throw Exception('Forbidden: ${error.message}');
      } else if (error.response!.statusCode == 500) {
        throw Exception('Internal Server Error: ${error.message}');
      } else {
        throw Exception('Network Error: ${error.message}');
      }
    }
  }




  Future<NetworkWrapper<Map<String,dynamic>>> postRequest(String endpoint, dynamic data,
      {Map<String, dynamic>? headers}) async {
    try {
      endpoint;
      data;
      Map<String, dynamic> defaultHeaders = {
        'access_token': await SharedPref.getAccessToken(),
        'Content-Type': 'application/json',
      };
      Response response = await _dio!.post(
        endpoint,
        data: data,
        options: Options(headers: headers ?? defaultHeaders),
      );

      // print('Response ===> $response');
      return NetworkWrapper(data: response.data);
    }on DioException catch (error) {
      if(error.response !=null){
        if (error.response!.statusCode == 403) {

          var message = error.response!.data as Map<String,dynamic>;
          var errorMessage = message['message']??"something went wrong";

          return NetworkWrapper(error: errorMessage);

        }
        else if (error.response!.statusCode == 500) {
          var message = error.response!.data as Map<String,dynamic>;
          var errorMessage = message['message']??"something went wrong";

          return NetworkWrapper(error: errorMessage);
        }
        else {

          var message = error.response!.data as Map<String,dynamic>;
          var errorMessage = message['message']??"something went wrong";
          // throw Exception('Network Error: ${error.message}');
          return NetworkWrapper(error: errorMessage);


        }
      }else{
        return NetworkWrapper(error: "Please check your Internet");
      }

    }
  }

  Future<Response> uploadfile(String endpoint, String value, File file) async {
    try {
      String fileName = file.path.split('/').last;
      FormData data = FormData.fromMap({
        value: await MultipartFile.fromFile(
          file.path,
          filename: fileName,
        ),
      });
      Response response = await _dio!.post(
        endpoint,
        data: data,
      );
      return response;
    } on DioException catch (error) {
      if (error.response!.statusCode == 403) {
        throw Exception('Forbidden: ${error.message}');
      } else if (error.response!.statusCode == 500) {
        throw Exception('Internal Server Error: ${error.message}');
      } else {
        throw Exception('Network Error: ${error.message}');
      }
    }
  }
}



