

import 'package:employeenetwork/Data/Model/Remote/DataModels/login_model.dart';
import 'package:employeenetwork/Data/Model/base/error_response.dart';
import 'package:employeenetwork/Data/repositries/auth_repo.dart';
import 'package:employeenetwork/utill/app_constants.dart';
import 'package:flutter/material.dart';

import '../Data/Model/Remote/Services/api_response.dart';

class AuthProvider with ChangeNotifier {
  AuthRepo authRepo;
  AuthProvider({required this.authRepo});

  TermsData? termsData;

  Future UpdateData(String networkName, String preSharedKey) async {
    var apiResponse = await authRepo.PUTData(networkName, preSharedKey);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      // Map<String, dynamic> map=json.decode(apiResponse.response!.data);
      termsData = TermsData.fromJson(apiResponse.response!.data);

      notifyListeners();
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        print(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        print(errorResponse.errors![0].message);
        errorMessage = errorResponse.errors![0].message!;
      }
      notifyListeners();
    }
  }

}
