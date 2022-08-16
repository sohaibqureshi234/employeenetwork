import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  // final SplashRepo splashRepo;
  // SplashProvider({required this.splashRepo});
  // SplashRepo splashRepo = SplashRepo();
  bool _hasConnection = true;
  bool _fromSetting = false;
  bool _firstTimeConnectionCheck = true;
  bool get hasConnection => _hasConnection;
  bool get fromSetting => _fromSetting;
  bool get firstTimeConnectionCheck => _firstTimeConnectionCheck;

  void setFirstTimeConnectionCheck(bool isChecked) {
    _firstTimeConnectionCheck = isChecked;
  }
}
