import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/widgets/image_source_sheet/image_source_sheet_widget.dart';
import 'add_edit_contact_store.dart';

class AddEditContactPage extends StatefulWidget {
  const AddEditContactPage();

  @override
  _AddEditContactPageState createState() => _AddEditContactPageState();
}

class _AddEditContactPageState
    extends ModularState<AddEditContactPage, AddEditContactStore> {
  @override
  void initState() {
    super.initState();
    controller.setupValidations();
  }

  ImageProvider<Object>? _getBgImage() {
    if (controller.photo is File) {
      return FileImage(controller.photo);
    } else {
      return MemoryImage(controller.photo is String
          ? base64Decode(controller.photo)
          : controller.photo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Modular.to.pop(),
        ),
        title: Text("Criar novo contato"),
        actions: <Widget>[
          FlatButton(
              child: Text(
                'SALVAR',
              ),
              disabledTextColor: Colors.white60,
              textColor: Colors.white,
              onPressed: () {
                if (controller.canSaveContact) {
                  controller.saveContact();
                }
              }),
        ],
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: <Widget>[
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (_) => ImageSourceSheetWidget(
                                  onImageSelected: (image) {
                                    if (image != null) {
                                      controller.photo = image;
                                    }
                                    Modular.to.pop();
                                  },
                                ));
                      },
                      child: Observer(builder: (BuildContext context) {
                        return Container(
                            width: 100.0,
                            height: 100.0,
                            child: controller.photo != null
                                ? CircleAvatar(
                                    backgroundImage: _getBgImage(),
                                  )
                                : CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    backgroundImage:
                                        AssetImage('images/profile.png'),
                                  ));
                      }),
                    ),
                  ],
                ),
                TextFormField(
                  controller: controller.txName,
                  keyboardType: TextInputType.text,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(45),
                  ],
                  validator: controller.validateName,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    icon: Icon(Icons.person),
                  ),
                ),
                TextFormField(
                  controller: controller.txPhone,
                  inputFormatters: [
                    controller.maskFormatter,
                  ],
                  keyboardType: TextInputType.phone,
                  validator: controller.validatePhone,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelText: 'Telefone',
                    icon: Icon(Icons.phone),
                  ),
                ),
                TextField(
                  controller: controller.txNickName,
                  keyboardType: TextInputType.text,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(25),
                  ],
                  decoration: InputDecoration(
                    labelText: 'Apelido',
                    icon: Icon(Icons.person),
                  ),
                ),
                TextField(
                  controller: controller.txWork,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(45),
                  ],
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Trabalho',
                    icon: Icon(Icons.work),
                  ),
                ),
                TextField(
                  controller: controller.txEmail,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(50),
                  ],
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    icon: Icon(Icons.email),
                  ),
                ),
                TextField(
                  controller: controller.txWebsite,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(50),
                  ],
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Site da Web',
                    icon: Icon(Icons.web),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
