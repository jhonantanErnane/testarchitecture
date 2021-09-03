import 'package:flutter_modular/flutter_modular.dart';
import 'package:testarchitecture/app/shared/constants/page_names.dart';

import 'add_edit_contact_store.dart';
import 'add_edit_contact_page.dart';

class AddEditContactModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => AddEditContactStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        // ChildRoute(Modular.initialRoute,
        //     child: (_, args) => AddEditContactPage()),
        ChildRoute('/${PageNames.addContact}', child: (_, args) => AddEditContactPage()),
        ChildRoute('/${PageNames.editContact}/:id', child: (_, args) => AddEditContactPage()),
      ];
}
