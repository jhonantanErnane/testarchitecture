import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';

import '../../../shared/constants/page_names.dart';
// import '../../../shared/models/hospital_dto.dart';

part 'initialData_store.g.dart';

class InitialDataStore = _InitialDataStoreBase with _$InitialDataStore;

abstract class _InitialDataStoreBase with Store {
  final ctrlName = TextEditingController();
  final ctrlEmail = TextEditingController();
  final ctrlOccupation = TextEditingController();
  final ctrlPhone = TextEditingController();
  final maskPhone = MaskTextInputFormatter(mask: '(##) #####-####');
  // late HospitalDto hospital;

  int count = 0;

  // @observable
  // List<HospitalDto> hospitalList = [];

  _InitialDataStoreBase() {
    _init();
  }

  @action
  Future<void> _init() async {
    // hospitalList = await getFakeHospital();
  }

  @action
  Future<void> submit() async {
    // final initialData = InitialData(
    //   ctrlName.text,
    //   ctrlEmail.text,
    //   hospital.name,
    //   maskPhone.getUnmaskedText(),
    // );
    // final p = maskPhone.getUnmaskedText();
    // ctrlPhone.clear();
    // await Future.delayed(Duration(milliseconds: 1000));
    // ctrlPhone.text = maskPhone.maskText(p);
    // print(initialData);
    count = 0;
    Modular.to.pushNamed(
      PageNames.getPath(paths: [PageNames.address], isAbsolut: false),
    );
  }

  // Future<List<HospitalDto>> getFakeHospital() async {
  //   await Future.delayed(Duration(milliseconds: 500));
  //   return [
  //     HospitalDto(id: '1', name: 'Hospital 1'),
  //     HospitalDto(id: '2', name: 'Hospital 2')
  //   ];
  // }
}


