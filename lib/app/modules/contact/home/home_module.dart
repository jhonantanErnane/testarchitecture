import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/widgets/config_modal/config_modal_store.dart';
import '../../../shared/widgets/contact_list/contact_list_store.dart';
import '../../../shared/widgets/custom_drawer/custom_drawer_store.dart';
import 'home_page.dart';
import 'home_store.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => ContactListStore()),
        Bind.lazySingleton((i) => HomeStore()),
        Bind.lazySingleton((i) => ConfigModalStore()),
        Bind.lazySingleton((i) => CustomDrawerStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

}
