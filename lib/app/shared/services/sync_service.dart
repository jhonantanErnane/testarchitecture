import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/subjects.dart';

import '../models/sync_event_enum.dart';
import '../models/contact.dart';
import '../models/sync_event_model.dart';
import '../repositories/repository_interface.dart';
import '../repositories/local_repository/local_repository_shared_preferences_service.dart';
import 'contact_service.dart';
import './sync_log_service.dart';

class SyncService extends Disposable {
  final _localRepositoryService =
      Modular.get<LocalRepositorySharedPreferencesService>();
  final _storage = Modular.get<ILocalRepository>();
  final _contactService = Modular.get<ContactService>();
  final _syncLogService = Modular.get<SyncLogService>();

  final _isSyncAutoCtrl = BehaviorSubject<bool>();
  final _synchronizingCtrl = BehaviorSubject<SyncEvent>();

  SyncService() {
    _init();
  }

  bool _isSyncAuto = false;

  Future<void> _init() async {
    setIsSyncAuto(await _localRepositoryService.getAutoSync());
  }

  Stream<bool> get isSyncAutoOut => _isSyncAutoCtrl.stream;

  void setIsSyncAuto(bool isSyncAuto) {
    _isSyncAuto = isSyncAuto;
    _isSyncAutoCtrl.add(isSyncAuto);
  }

  Stream<SyncEvent> get startSync {
    _synchronizing();
    return _synchronizingCtrl.stream;
  }

  Future<void> _synchronizing() async {
    _syncLogService.clearSyncLog();
    _synchronizingCtrl.add(
        SyncEvent(message: 'Iniciou...', eventEnum: SyncEventEnum.STARTED));
    await Future.delayed(Duration(seconds: 3));
    // For sync first send all
    List<int> listContactIds = await _storage.getContactsNotSync();
    _synchronizingCtrl.add(SyncEvent(
        message: '${listContactIds.length} contatos a serem sincronizados...', eventEnum: SyncEventEnum.STARTED));
    // await Future.delayed(Duration(seconds: 3));
    //send all contacts
    int contactsSynced = 0;

    if (listContactIds.length > 0) {
      for (int id in listContactIds) {
        Contact contactUpdated = await _contactService.sendContact(id);
        if (contactUpdated ==null) {
          
        } else {
        await _storage.putContact(contactUpdated);
        }
        contactsSynced++;
        _synchronizingCtrl.add(SyncEvent(
            message: '$contactsSynced / ${listContactIds.length}',
            eventEnum: SyncEventEnum.SYNCING));
        // await Future.delayed(Duration(seconds: 3));
      }
    }

    _synchronizingCtrl.add(SyncEvent(
        message: '$contactsSynced / ${listContactIds.length}',
        eventEnum: SyncEventEnum.ENDED));
    await Future.delayed(Duration(seconds: 3));

    // get all contacts that not already is in the device
    // List<String> ids = await _storage.getAllContactsIds();
  }

  @override
  void dispose() {
    _isSyncAutoCtrl.close();
    _synchronizingCtrl.close();
  }
}
