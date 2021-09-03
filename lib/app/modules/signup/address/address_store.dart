import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';

import '../../../shared/constants/page_names.dart';

part 'address_store.g.dart';

class AddressStore = _AddressStoreBase with _$AddressStore;

abstract class _AddressStoreBase with Store {
  final maskCep = MaskTextInputFormatter(mask: '#####-###');
  final ctrlCep = TextEditingController();
  final ctrlStreetName = TextEditingController();
  final ctrlNumber = TextEditingController();
  final ctrlAddressComplement = TextEditingController();
  final ctrlCity = TextEditingController();
  final ctrlState = TextEditingController();

  int count = 0;

  @action
  void submit() {
    count = 0;
    // Modular.to.pushNamed(
    //   PageNames.getPath(paths: [PageNames.address], isAbsolut: false),
    // );
    Modular.to.pushNamedAndRemoveUntil(
        PageNames.getPath(paths: [PageNames.auth, PageNames.login]),
        ModalRoute.withName(
          PageNames.auth + '/',
        ));
  }
}
