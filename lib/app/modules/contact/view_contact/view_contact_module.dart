import 'package:flutter_modular/flutter_modular.dart';

import 'view_contact_store.dart';
import 'view_contact_page.dart';

class ViewContactModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => ViewContactStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/:id', child: (_, args) => ViewContactPage()),
      ];
}
