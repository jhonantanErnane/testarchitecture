import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:testarchitecture/app/shared/constants/page_names.dart';
import 'package:testarchitecture/app/shared/services/auth_service.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final _authService = Modular.get<AuthService>();

  void login() {
    _authService.changeUserState(true);
    Modular.to.pushNamed(PageNames.getPath(paths: [
      PageNames.contact,
      PageNames.contactHome,
    ]));
  }
}
