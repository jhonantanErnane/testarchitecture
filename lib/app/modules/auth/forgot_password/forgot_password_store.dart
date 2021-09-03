import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../shared/utils/utils.dart';

part 'forgot_password_store.g.dart';

class ForgotPasswordStore = _ForgotPasswordStoreBase with _$ForgotPasswordStore;

abstract class _ForgotPasswordStoreBase with Store {
  final ctrlEmail = TextEditingController();

  int count = 0;

  @action
  Future<void> submit() async {
    print(ctrlEmail.text);
    count = 0;
    Utils.instance.showLoading();
    await Future.delayed(Duration(seconds: 1));
    // Utils.instance.dismiss();
    await Utils.instance.showToast(
        'E-mail de recuperação de senha enviado para ${ctrlEmail.text}');
    // Utils.instance.getStatus.listen((event) {});
    // Modular.to.pop();
  }
}
