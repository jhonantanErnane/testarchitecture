import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/constants/page_names.dart';
import '../../../shared/widgets/btn_rounded_widget.dart';
import '../../../shared/widgets/container_default_widget.dart';
import '../../../shared/widgets/custom_app_bar_widget.dart';
import '../../../shared/widgets/text_field_default_widget.dart';
import 'login_store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage();

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ModularState<LoginPage, LoginStore> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBarWidget(
        title: '',
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
                TextFieldDefaultWidget(
                  hintText: 'E-mail',
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFieldDefaultWidget(
                  hintText: 'Senha',
                ),
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                BtnRoundedWidget(
                  text: 'Entrar',
                  onTap: () {
                    print(Modular.to.modulePath);
                    controller.login();
                  },
                  primaryTheme: true,
                ),
                SizedBox(
                  height: 10,
                ),
                BtnRoundedWidget(
                  isElevatedButton: false,
                  text: 'Esqueci minha senha',
                  onTap: () => Modular.to.pushNamed(PageNames.getPath(
                      paths: [PageNames.forgotPassword], isAbsolut: false)),
                  primaryTheme: false,
                ),
                SizedBox(
                  height: 10,
                ),
                BtnRoundedWidget(
                  isElevatedButton: false,
                  text: 'Cadastrar-se',
                  onTap: () {
                    Modular.to.pushNamed(PageNames.getPath(
                        paths: [PageNames.signup], isAbsolut: true));
                  },
                  primaryTheme: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
