import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/widgets/btn_rounded_widget.dart';
import '../../../shared/widgets/container_default_widget.dart';
import '../../../shared/widgets/custom_app_bar_widget.dart';
import '../../../shared/widgets/text_field_default_widget.dart';
import 'address_store.dart';

class AddressPage extends StatefulWidget {
  const AddressPage();
  @override
  AddressPageState createState() => AddressPageState();
}

class AddressPageState extends ModularState<AddressPage, AddressStore> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBarWidget(
        isWhiteTheme: false,
        title: 'Endereço',
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: ContainerDefaultWidget(
            height: screenSize.height * 0.85,
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  TextFieldDefaultWidget(
                    hintText: 'CEP',
                    controller: controller.ctrlCep,
                    inputFormatters: [controller.maskCep],
                    textInputType: TextInputType.number,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldDefaultWidget(
                    hintText: 'Logradouro',
                    controller: controller.ctrlStreetName,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldDefaultWidget(
                    hintText: 'Numero',
                    controller: controller.ctrlNumber,
                    textInputType: TextInputType.number,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldDefaultWidget(
                    hintText: 'Complemento',
                    controller: controller.ctrlAddressComplement,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldDefaultWidget(
                    hintText: 'Cidade',
                    controller: controller.ctrlCity,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldDefaultWidget(
                    hintText: 'Estado',
                    controller: controller.ctrlState,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                  ),
                  Spacer(),
                  BtnRoundedWidget(
                    text: 'Finalizar Cadastro',
                    onTap: () {
                      // print(Modular.to.modulePath);
                      // Modular.to.navigate('/' + PageNames.signup + '/',
                      //     replaceAll: true);
                      controller.count++;
                      if (formKey.currentState!.validate() ||
                          controller.count == 2) {
                        print('valido!!!!!!!!');
                        controller.submit();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
