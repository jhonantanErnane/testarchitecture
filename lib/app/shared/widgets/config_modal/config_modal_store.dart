import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../services/sync_service.dart';
part 'config_modal_store.g.dart';

class ConfigModalStore = _ConfigModalStoreBase
    with _$ConfigModalStore;

abstract class _ConfigModalStoreBase with Store {
  final _syncService = Modular.get<SyncService>();

  _ConfigModalStoreBase() {
    isSyncAutoStream =
        ObservableStream(_syncService.isSyncAutoOut, initialValue: false);
  }

  @observable
  late ObservableStream<bool> isSyncAutoStream;

  @action
  Future<void> toggleSync(bool toggle) async {
    _syncService.setIsSyncAuto(toggle);
  }

}
