import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:host/ui/screens/home/event_details_response.dart';
import 'package:host/ui/screens/home/sitting_plan_response.dart';
import 'package:host/ui/screens/menu/menu_category_response.dart';
import 'package:host/ui/screens/profile/profile_response.dart';
import 'package:host/utils/SharedPref.dart';

import '../ui/screens/menu/menu_item_list_respoonse.dart';
import '../utils/api_constants.dart';

class AppRepo {
  static final AppRepo _appRepo = AppRepo._internal();

  factory AppRepo() => _appRepo;

  AppRepo._internal();

  Dio? _dio;

  hitApi(String api,
      {dynamic params,
      bool accessToken = true,
      bool isMultiApi = false,
      List<String>? apis}) async {
    BaseOptions options = BaseOptions(
      baseUrl: "http://51.112.6.160:3000/",
    );

    _dio = Dio(options)
      ..interceptors.add(LogInterceptor(responseBody: true, requestBody: true))
      ..interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) async {
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
    try {
      if (isMultiApi) {
        final responses = await Future.wait([
          _dio!.post(apis![0], data: params),
          _dio!.post(apis[1], data: params)
        ]);
        return responses;
      } else {
        if (params != null) {
          // Post Api

          Options? options;
          if (accessToken) {
            var userData = await SharedPref().getUserData();
            var headers = {'access_token': userData?.accessToken ?? ''};
            options = Options(headers: headers);
          }
          final response =
              await _dio?.post(api, data: params, options: options);
          return response?.data;
        } else {
          // Get Api
          // var userData = await SharedPreferencesUtils().getUserData();

          // var headers = {'access_token': userData?.accessToken ?? ''};
          final response = await _dio?.get(
            api,
            // options: Options(headers: headers)
          );

          return response?.data;
        }
      }
    } on DioException catch (error) {
      if (error.response!.statusCode == 403) {
        throw Exception('Forbidden: ${error.message}');
      } else if (error.response!.statusCode == 500) {
        throw Exception('Internal Server Error: ${error.message}');
      } else if (error.response!.statusCode == 401) {
        // throw Exception(error.message);
        Fluttertoast.showToast(
            msg: 'Invalid request : Please try to login again.');
        // SharedPreferencesUtils().logoutUser();
      } else {
        throw Exception('Network Error: ${error.message}');
      }
    }
  }

  Future<MenuCategoryResponse> getMenuCategory({required ceremonyId}) async {
    try {
      final response = await hitApi(ApiConstants.getMenuCategory,
          params: {'ceremony_id': ceremonyId});
      return MenuCategoryResponse.fromJson(response);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<MenuItemListResponse> getMenuItems({required categoryId}) async {
    try {
      final response = await hitApi(ApiConstants.getMenuItems,
          params: {'category_id': categoryId});
      return MenuItemListResponse.fromJson(response);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ProfileResponse> getProfileDetails() async {
    try {
      final userData = await SharedPref().getUserData();

      final response = await hitApi(ApiConstants.getProfileDetails,
          params: {'restaurant_id': userData?.restaurantId ?? ''},
          accessToken: true);
      return ProfileResponse.fromJson(response);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<dynamic>> getHomeData() async {
    var userData = await SharedPref().getUserData();
    var map = {'cermony_id': userData?.ceremonyId ?? ''};
    debugPrint(map.toString());

    try {
      final responses = await hitApi('',
          params: {'cermony_id': userData?.ceremonyId ?? ''},
          apis: [
            ApiConstants.getSittingPlanDetails,
            ApiConstants.getEventDetails
          ],
          isMultiApi: true);

      // final responses = await Future.wait([
      //   _dio!.post(ApiConstants.getSittingPlanDetails, data: map),
      //   _dio!.post(ApiConstants.getEventDetails, data: map)
      // ]);

      var sittingPlanResponse = SittingPlanResponse.fromJson(responses[0].data);
      var eventDetailsResponse =
          EventDetailsResponse.fromJson(responses[1].data);

      return [sittingPlanResponse, eventDetailsResponse];
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
