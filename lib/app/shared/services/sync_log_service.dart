import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';

class SyncLogService extends Disposable {
  final _syncLogCtrl = BehaviorSubject<List<String>>();

  Stream<List<String>> get syncLogOut => _syncLogCtrl.stream;

  void setSyncLog(String message) {
    final listMessage = _syncLogCtrl.value;
    listMessage.add(message);
    _syncLogCtrl.add(listMessage);
  }

  void clearSyncLog() {
    _syncLogCtrl.value = [];
  }

  @override
  void dispose() {
    _syncLogCtrl.close();
  }
}

