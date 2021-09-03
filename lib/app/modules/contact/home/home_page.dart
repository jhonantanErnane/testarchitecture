import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:testarchitecture/app/shared/constants/page_names.dart';

import '../../../shared/delegates/search_contact_delegate.dart';
import '../../../shared/widgets/contact_list/contact_list_widget.dart';
import '../../../shared/widgets/custom_drawer/custom_drawer_widget.dart';
import '../../../shared/widgets/custom_loading/custom_loading_widget.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawerWidget(),
        appBar: PreferredSize(
            preferredSize: const Size(double.infinity, kToolbarHeight),
            child: AppBar(
              title: Text("Contatos"),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async {
                    await showSearch(
                        context: context,
                        delegate: SearchContact(
                          onNavigation: controller.onNavigation,
                          onDelete: controller.delContact,
                        ));
                  },
                ),
              ],
            )),
        body: Observer(builder: (_) {
          return CustomLoadingWidget(
            isLoading: controller.isLoading,
            child: ContactListWidget(
              isLoading: controller.isLoading,
              contacts: controller.contacts,
              onNavigation: controller.onNavigation,
              onDelete: controller.delContact,
            ),
          );
        }),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            // final param = await Modular.to.pushNamed('contacts/add') as Map;
            // final param = await Modular.to.pushNamed() as Map;
            // final param = await Modular.to.pushNamed<Map<String, dynamic>>(PageNames.getPath(
            final param = await Modular.to.pushNamed(PageNames.getPath(paths: [
              PageNames.contact,
              PageNames.addEditContact,
              PageNames.addContact
            ], isAbsolut: true));
            controller.onNavigation(param as Map<String, dynamic>?);
            // await controller.delContacts();
          },
        ));
  }
}

// FabMenuWidget(onPressedAdd: () async {
//         final param = await Modular.to.pushNamed('contacts/add') as Map;
//         controller.onNavigation(param);
//         // await controller.delContacts();
//       }, onPressedSettings: () async {
//         final resp = await showDialog(
//             context: context, builder: (_) => ConfigModalWidget());
//         if (resp != null && resp.syncManually) {
//           // TODO: Make another dialog to show the progress of the send
//         }
//       })
