import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class UserService {
  final String _baseUrl =
      "http://88.85.251.150:8001/sap/opu/odata/SAP/ZAQI_CWA_SALES_SRV/DRIVER_AUTHSet";

  dynamic AuthLogin(BuildContext context, var map) async {
    dynamic responseJson;

    try {

      String username = 'cwauser';
      String password = 'init12345';
      String basicAuth =
          'Basic ' + base64Encode(utf8.encode('$username:$password'));
      print(basicAuth);

      String url = 'DRIVER_AUTHSet';
      var response = await post(Uri.parse(_baseUrl),
          headers: <String, String>{
            'Accept': "application/json",
            'X-Requested-With': "X",
            'Content-Type': "application/json",
            'authorization': basicAuth
          },
          body: jsonEncode(map),
          encoding: Encoding.getByName("utf-8"));

      Map<String, dynamic> jsondata = jsonDecode(response.body);
      // final authUser = authUserFromMap(response.body);

      // print(response.body.toString());
      print(jsondata["d"]["StatusCode"]);
      print(response.statusCode);
      responseJson = returnResponse(jsondata, context);
      print(responseJson);
    } on SocketException {
      throw HttpException('No Internet Connection');
    }
    return responseJson;
  }

  @visibleForTesting
  dynamic returnResponse(var jsondata, BuildContext context) {
    String responsecode = jsondata["d"]["StatusCode"];
    String responsemsg = jsondata["d"]["Message"];
    switch (responsecode) {
      case "200":
        // dynamic responseJson = jsonDecode(response.body);
        return jsondata;
      case "400":
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(responsemsg),
        ));
        return null;
      case "401":
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(responsemsg),
        ));
        return null;
      case "403":
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(responsemsg),
        ));
        break;
      case "500":
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(responsemsg),
        ));
        return null;
      default:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              "Error occured while communication with server with status code : ${responsecode}"),
        ));
        return null;
    }
  }
}
