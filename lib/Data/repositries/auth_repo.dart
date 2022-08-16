import 'dart:convert';



import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:employeenetwork/Data/Model/Remote/Apis/dio/dio_client.dart';

import 'package:employeenetwork/Data/Model/Remote/Apis/exception/api_error_handler.dart';
import 'package:employeenetwork/Data/Model/base/api_response.dart';
import 'package:employeenetwork/utill/app_constants.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthRepo {
  DioClient dioClient;
  SharedPreferences sharedPreferences;
  AuthRepo({required this.dioClient, required this.sharedPreferences});

  Future<ApiResponse> PUTData(String networkName, String preSharedKey) async {

    var d={"networkName":networkName,
      "preSharedKey":preSharedKey
    };
    var jsn=  json.encode(d);
    print("${jsn}============== hherrrreee");
    try {
      print("Ok 10");
      var response = await dioClient.put(
        AppConstants.PUT_DATA,
        data:jsn
      );
      print("Ok 11");
      print("response");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      print("Ok 12");
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
