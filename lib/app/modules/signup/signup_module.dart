import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/constants/page_names.dart';
import 'address/address_page.dart';
import 'address/address_store.dart';
import 'initial_data/initialData_page.dart';
import 'initial_data/initialData_store.dart';

class SignupModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => InitialDataStore()),
    Bind.lazySingleton((i) => AddressStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/${PageNames.initialData}', child: (_, args) => InitialDataPage()),
    ChildRoute('/${PageNames.address}', child: (_, args) => AddressPage()),
  ];
}
