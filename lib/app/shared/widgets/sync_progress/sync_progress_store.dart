import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/services/sync_log_service.dart';
import '../../models/sync_event_enum.dart';
import '../../services/sync_service.dart';

part 'sync_progress_store.g.dart';

@Injectable()
class SyncProgressStore = _SyncProgressStoreBase
    with _$SyncProgressStore;

abstract class _SyncProgressStoreBase with Store {
  final _syncService = Modular.get<SyncService>();
  final _syncLogService = Modular.get<SyncLogService>();

  Future<void> init(bool startSync) async {
    if (startSync) {
      startSyncManually();
    }

    syncLogs = ObservableStream(_syncLogService.syncLogOut, initialValue: []);
  }

  @observable
  late ObservableStream<List<String>> syncLogs;

  @observable
  String message = '';

  @action
  void startSyncManually() {
    _syncService.startSync.takeWhile((element) {
      if (element.eventEnum != SyncEventEnum.ENDED) {
        return true;
      } else {
        return false;
      }
    }).listen(
      (event) async {
        print(event.message);
        message = event.message;
      },
    );
  }
}
