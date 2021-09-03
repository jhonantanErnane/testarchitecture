import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/constants/page_names.dart';
import 'general_Page.dart';
import 'general_store.dart';
import 'pages/Demo1_page.dart';
import 'pages/demo4_page.dart';

import 'pages/demo2_page.dart';
import 'pages/demo3_page.dart';

class GeneralModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => GeneralStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => GeneralPage()),
    ChildRoute('/${PageNames.demo1}', child: (_, args) => Demo1Page()),
    ChildRoute('/${PageNames.demo2}', child: (_, args) => Demo2Page()),
    ChildRoute('/${PageNames.demo3}', child: (_, args) => Demo3Page()),
    ChildRoute('/${PageNames.demo4}', child: (_, args) => Demo4Page()),
  ];
}
