import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class OrdersServices {
  final String _baseUrl = "https://fakestoreapi.com/";

  dynamic getallCustomers(BuildContext context) async {
    dynamic responseJson;

    try {
      String url = 'carts';
      var response = await http.get(Uri.parse(_baseUrl + url));

      // Map<String, dynamic> jsondata = jsonDecode(response.body);
      // final authUser = authUserFromMap(response.body);

      // print(response.body.toString());
      // print(jsondata["d"]["StatusCode"]);
      print(response.statusCode);
      responseJson = response.body;
      print(response.body);
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
