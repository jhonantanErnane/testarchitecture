import 'package:flutter_modular/flutter_modular.dart';
import 'package:testarchitecture/app/shared/services/auth_service.dart';

import '../../shared/constants/page_names.dart';
import '../../shared/repositories/local_repository/local_repository_sqlite.dart';
import 'contact/add_edit_contact_module.dart';
import 'home/home_module.dart';
import 'view_contact/view_contact_module.dart';

class ContactModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LocalRepositorySqlite()),
    Bind.lazySingleton((i) => AuthService.instance),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      '/${PageNames.contactHome}',
      module: HomeModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/${PageNames.addEditContact}',
      module: AddEditContactModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/${PageNames.view}',
      module: ViewContactModule(),
      transition: TransitionType.fadeIn,
    ),
  ];
}
