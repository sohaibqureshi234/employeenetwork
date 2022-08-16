// To parse this JSON data, do
//
//     final termsData = termsDataFromJson(jsonString);

import 'dart:convert';

TermsData termsDataFromJson(String str) => TermsData.fromJson(json.decode(str));

String termsDataToJson(TermsData data) => json.encode(data.toJson());

class TermsData {
  TermsData({
    required this.success,
    required this.data,
  });

  String success;
  Data data;

  factory TermsData.fromJson(Map<String, dynamic> json) => TermsData(
    success: json["success"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.networkName,
    required this.preSharedKey,
  });

  String id;
  String networkName;
  String preSharedKey;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    networkName: json["networkName"],
    preSharedKey: json["preSharedKey"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "networkName": networkName,
    "preSharedKey": preSharedKey,
  };
}
