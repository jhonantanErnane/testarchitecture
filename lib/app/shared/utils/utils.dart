import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';

import '../constants/app_colors.dart';

class Utils extends Disposable {
  static Utils? _instance;
  final _statusCtrl = BehaviorSubject<EasyLoadingStatus>();
  Stream<EasyLoadingStatus> get getStatus => _statusCtrl.stream;

  Utils._() {
    _init();
  }

  static Utils get instance {
    if (_instance == null) {
      _instance = Utils._();
    }
    return _instance!;
  }

  void _init() {
    EasyLoading.addStatusCallback((EasyLoadingStatus status) {
      print(status);
      _statusCtrl.add(status);
    });
  }

  void showLoading() {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..maskType = EasyLoadingMaskType.custom
      ..maskColor = Colors.black45
      ..indicatorWidget = customProgressIndicator
      ..backgroundColor = Colors.transparent
      ..textColor = Colors.transparent
      ..indicatorColor = Colors.transparent
      ..userInteractions = false
      ..dismissOnTap = false;
    EasyLoading.show();
  }

  Future<void> showToast(String message) async {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 3000)
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = AppColors.primaryColor
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.white
      ..toastPosition = EasyLoadingToastPosition.center
      ..maskType = EasyLoadingMaskType.black
      ..textStyle = TextStyle(color: Colors.white, fontSize: 25)
      ..dismissOnTap = true;
    await EasyLoading.showToast(message);
  }

  Widget get customProgressIndicator => CircularProgressIndicator(
      backgroundColor: Colors.transparent,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white));

  dismiss() {
    EasyLoading.dismiss();
  }

  @override
  void dispose() {
    EasyLoading.removeAllCallbacks();
    _statusCtrl.close();
  }
}
