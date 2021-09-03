import 'package:firebase_core/firebase_core.dart';
import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = _AppBase with _$AppStore;

abstract class _AppBase with Store {
  _AppBase() {
    _init();
  }

  _init() {
    _initializeFirebaseProject();
  }

  Future<void> _initializeFirebaseProject() async {
    FirebaseApp app = await Firebase.initializeApp();
    print('Initialized $app');
  }
}
