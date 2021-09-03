import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:testarchitecture/app/shared/constants/page_names.dart';

import '../../models/drawer_tile_model.dart';
import '../../widgets/config_modal/config_modal_widget.dart';
import 'custom_drawer_store.dart';
import '../../widgets/drawer_tile/drawer_tile_widget.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget();
  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<CustomDrawerStore>();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                                'images/flutter_transparent_logo.png'))),
                  ),
                  Text(
                    'App de contatos',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
          Observer(builder: (_) {
            final drawerTileList =
                buildListOptions(controller.isloggedStream!.value ?? false, _);

            return ListView.builder(
              shrinkWrap: true,
              itemCount: drawerTileList.length,
              itemBuilder: (_, index) {
                return DrawerTileWidget(
                  model: drawerTileList[index],
                  islast: drawerTileList.length - 1 == index,
                );
              },
            );
          })
        ],
      ),
    );
  }

  List<DrawerTileModel> buildListOptions(bool isLogged, BuildContext context) {
    return [
      DrawerTileModel(
          displayText: 'Todos os contatos',
          icon: Icons.list,
          onTap: () {
            Modular.to.pop();
            Modular.to.pushReplacementNamed('/');
          }),
      DrawerTileModel(
          displayText: 'Novo contato',
          icon: Icons.person,
          onTap: () {
            Modular.to.pop();
            Modular.to.pushNamed(PageNames.getPath(paths: [
              PageNames.contact,
              PageNames.addEditContact,
              PageNames.addContact,
            ]));
          }),
      DrawerTileModel(
          displayText: 'Configurações',
          icon: Icons.settings,
          onTap: () {
            Modular.to.pop();
            showDialog(context: context, builder: (_) => ConfigModalWidget());
          }),
      isLogged
          ? DrawerTileModel(
              displayText: 'Logoff',
              icon: Icons.exit_to_app,
              onTap: () {
                Modular.to.pop();
                Modular.to.pushReplacementNamed('/');
              })
          : DrawerTileModel(
              displayText: 'Login',
              icon: Icons.login,
              onTap: () {
                Modular.to.pop();
                Modular.to.pushReplacementNamed('/');
              })
    ];
  }
}
