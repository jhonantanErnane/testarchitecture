import 'package:flutter_modular/flutter_modular.dart';

import 'about_controller.dart';
import 'about_page.dart';

class AboutModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => AboutController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => AboutPage()),
      ];

}
