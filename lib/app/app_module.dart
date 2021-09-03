import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_store.dart';
import 'modules/auth/auth_module.dart';
import 'modules/contact/contact_module.dart';
import 'modules/general/general_module.dart';
import 'modules/signup/signup_module.dart';
import 'shared/constants/page_names.dart';
import 'splash/splash_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) async => await SharedPreferences.getInstance()),
    Bind.singleton((i) => AppStore())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SplashPage()),
    ModuleRoute(
      '/${PageNames.general}',
      module: GeneralModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/${PageNames.auth}',
      module: AuthModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/${PageNames.signup}',
      module: SignupModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/${PageNames.contact}',
      module: ContactModule(),
      transition: TransitionType.fadeIn,
    ),
  ];
}
