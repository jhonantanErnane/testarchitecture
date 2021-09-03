import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/widgets/btn_rounded_with_back_widget.dart';
import '../../../shared/widgets/container_default_widget.dart';
import '../../../shared/widgets/custom_app_bar_widget.dart';
import '../../../shared/widgets/text_field_default_widget.dart';
import 'initialData_store.dart';

class InitialDataPage extends StatefulWidget {
  const InitialDataPage();
  @override
  InitialDataPageState createState() => InitialDataPageState();
}

class InitialDataPageState
    extends ModularState<InitialDataPage, InitialDataStore> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBarWidget(
        isWhiteTheme: false,
        title: 'Complete seu Cadastro',
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
                    hintText: 'Nome Completo',
                    controller: controller.ctrlName,
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
                    hintText: 'E-mail',
                    controller: controller.ctrlEmail,
                    textInputType: TextInputType.emailAddress,
                    validator: (text) {
                      final pattern =
                          r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
                      final regExp = RegExp(pattern);

                      if (text!.isEmpty) {
                        return 'Campo obrigatório';
                      } else if (!regExp.hasMatch(text)) {
                        return 'E-mail inválido';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldDefaultWidget(
                    hintText: 'Telefone',
                    controller: controller.ctrlPhone,
                    inputFormatters: [controller.maskPhone],
                    textInputType: TextInputType.number,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                  ),
                  Spacer(),
                  BtnRoundedWithBackWidget(
                    arrowIsBack: false,
                    whiteTheme: false,
                    text: 'Proximo',
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
