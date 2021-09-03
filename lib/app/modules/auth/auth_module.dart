import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/constants/page_names.dart';
import 'forgot_password/forgot_password_page.dart';
import 'forgot_password/forgot_password_store.dart';
import 'login/login_page.dart';
import 'login/login_store.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore()),
    Bind.lazySingleton((i) => ForgotPasswordStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/${PageNames.login}',
      child: (_, args) => LoginPage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      '/${PageNames.forgotPassword}',
      child: (_, args) => ForgotPasswordPage(),
      transition: TransitionType.fadeIn,
    ),
  ];
}
