import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../widgets/sync_progress/sync_progress_widget.dart';

import 'config_modal_store.dart';

class ConfigModalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<ConfigModalStore>();

    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Configurações'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Sincronizar automaticamente: '),
                Observer(builder: (_) {
                  return Switch(
                      value: controller.isSyncAutoStream.value ?? false,
                      onChanged: controller.toggleSync);
                })
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Observer(builder: (context) {
              return controller.isSyncAutoStream.value!
                  ? Container()
                  : RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      onPressed: () {
                        Modular.to.pop();
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) => SyncProgressWidget(
                                  startSync: true,
                                ));
                      },
                      color: Colors.indigoAccent,
                      textColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.sync),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Sincronizar',
                                style: TextStyle(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
            })
          ],
        ),
      ),
    );
  }
}
