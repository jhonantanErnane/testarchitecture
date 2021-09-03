import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../services/auth_service.dart';

part 'custom_drawer_store.g.dart';

class CustomDrawerStore = _CustomDrawerBase with _$CustomDrawerStore;

abstract class _CustomDrawerBase with Store {
  final _authService = Modular.get<AuthService>();

  @observable
  ObservableStream<bool>? isloggedStream;

  _CustomDrawerBase() {
    isloggedStream = ObservableStream(_authService.isLogged);
  }
}
