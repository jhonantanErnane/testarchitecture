import 'package:mobx/mobx.dart';

part 'general_store.g.dart';

class GeneralStore = _GeneralStoreBase with _$GeneralStore;
abstract class _GeneralStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}