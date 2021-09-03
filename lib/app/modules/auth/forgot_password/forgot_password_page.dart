import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/widgets/btn_rounded_widget.dart';
import '../../../shared/widgets/container_default_widget.dart';
import '../../../shared/widgets/custom_app_bar_widget.dart';
import '../../../shared/widgets/text_field_default_widget.dart';
import 'forgot_password_store.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage();

  @override
  ForgotPasswordPageState createState() => ForgotPasswordPageState();
}

class ForgotPasswordPageState
    extends ModularState<ForgotPasswordPage, ForgotPasswordStore> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBarWidget(
        title: 'Esqueci senha',
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: ContainerDefaultWidget(
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.flutter_dash,
                  size: screenSize.width * 0.35,
                ),
                SizedBox(
                  height: screenSize.height * 0.10,
                ),
                Form(
                  key: formKey,
                  child: TextFieldDefaultWidget(
                    controller: controller.ctrlEmail,
                    textInputType: TextInputType.emailAddress,
                    hintText: 'E-mail',
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
                ),
                SizedBox(
                  height: 20,
                ),
                BtnRoundedWidget(
                  text: 'Recuperar Senha',
                  onTap: () {
                    controller.count++;
                    if (formKey.currentState!.validate() ||
                        controller.count == 2) {
                      print('valido!!!!!!!!');
                      controller.submit();
                    }
                  },
                  primaryTheme: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
