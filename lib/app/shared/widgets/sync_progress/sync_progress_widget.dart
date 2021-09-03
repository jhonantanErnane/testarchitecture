import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'sync_progress_store.dart';

class SyncProgressWidget extends StatefulWidget {
  final bool startSync;

  SyncProgressWidget({required this.startSync});

  @override
  _SyncProgressWidgetState createState() => _SyncProgressWidgetState();
}

class _SyncProgressWidgetState
    extends ModularState<SyncProgressWidget, SyncProgressStore> {
  @override
  void initState() {
    super.initState();
    controller.init(widget.startSync);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Observer(builder: (_) {
              return Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Sincronizando seus contatos... \n ${controller.message}',
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.syncLogs.value?.length,
                      itemBuilder: (BuildContext context, int index) {
                        final list = controller.syncLogs.value;
                        if (list != null && list.length > 0) {
                          return Column(
                            children: [
                              Text(
                                'Ocorreu erro no processo de sincronização: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                list[index],
                                style: TextStyle(color: Colors.redAccent),
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      onPressed: () => Modular.to.pop(),
                      color: Colors.indigoAccent,
                      textColor: Colors.white,
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'OK',
                            style: TextStyle(),
                            textAlign: TextAlign.center,
                          )),
                    )
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
