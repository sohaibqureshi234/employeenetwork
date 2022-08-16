import 'package:dio/dio.dart';

class ApiResponse {
  final Response? response;
  final dynamic error;

  ApiResponse(this.response, this.error);

  ApiResponse.withError(dynamic errorValue)
      : response = null,
        error = errorValue;

  ApiResponse.withSuccess(Response responseValue)
      : response = responseValue,
        error = null;
}

// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
//
// class ApiResponse {
//   dynamic ApiResponses(Response response) async {
//     var jsondata = jsonDecode(response.body);
//     String responsecode = jsondata["code"];
//     // String responsemsg = jsondata["Message"];
//     String responsemsg = " Error calling API";
//     switch (responsecode) {
//       case "200":
//         // dynamic responseJson = jsonDecode(response.body);
//         return jsondata;
//       case "400":
//         // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         //   content: Text(responsemsg),
//         // ));
//         return responsecode;
//       case "401":
//         // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         //   content: Text(responsemsg),
//         // ));
//         return responsecode;
//       case "403":
//         // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         //   content: Text(responsemsg),
//         // ));
//         break;
//       case "500":
//         // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         //   content: Text(responsemsg),
//         // ));
//         return responsecode;
//       default:
//         // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         //   content: Text(
//         //       "Error occured while communication with server with status code : ${responsecode}"),
//         // ));
//         return responsecode;
//     }
//
//     //
//     // try {
//     //   var response = await http
//     //       .get(Uri.parse(AppConstants.BASE_URL + AppConstants.COMPANY_SETTING));
//     //   print(response.statusCode);
//     //   responseJson = response.body;
//     // } on SocketException {
//     //   throw HttpException('No Internet Connection');
//     // }
//     // return responseJson;
//   }
//
//   @visibleForTesting
//   dynamic returnResponse(var jsondata, BuildContext context) {}
//
//   // ApiResponse(this.response, this.error);
//   //
//   // ApiResponse.withError(dynamic errorValue)
//   //     : response = null,
//   //       error = errorValue;
//   //
//   // ApiResponse.withSuccess(Response responseValue)
//   //     : response = responseValue,
//   //       error = null;
// }
