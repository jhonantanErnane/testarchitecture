import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';
import 'package:testarchitecture/app/shared/utils/utils.dart';

import '../../../shared/models/contact.dart';
import '../../../shared/repositories/repository_interface.dart';

part 'add_edit_contact_store.g.dart';

class AddEditContactStore = _AddEditContactStoreBase with _$AddEditContactStore;

abstract class _AddEditContactStoreBase with Store {
  final _storage = Modular.get<ILocalRepository>();

  final formKey = GlobalKey<FormState>();

  final TextEditingController txName = TextEditingController();
  final TextEditingController txPhone = TextEditingController();
  final TextEditingController txNickName = TextEditingController();
  final TextEditingController txEmail = TextEditingController();
  final TextEditingController txWork = TextEditingController();
  final TextEditingController txWebsite = TextEditingController();

  Contact contact = Contact();

  @observable
  dynamic photo;

  @computed
  bool get canSaveContact => formKey.currentState?.validate() ?? false;

  final maskFormatter = new MaskTextInputFormatter(
      mask: '(##) #####-####', filter: {"#": RegExp(r'[0-9]')});

  Future<void> setupValidations() async {
    if (Modular.args != null && Modular.args!.params['id'] != null) {
      await _getContact(int.parse(Modular.args!.params['id']));
    }
  }

  Future<void> _getContact(int id) async {
    final respContact = await _storage.getContact(int.parse(Modular.args!.params['id']));
    if (respContact != null) {
      setContact(respContact);
    }
  }

  @action
  void setContact(Contact c) {
    contact = c;
    txName.text = c.name!;
    txPhone.text = c.phoneNumber!;
    maskFormatter.formatEditUpdate(
        TextEditingValue(), TextEditingValue(text: txPhone.text));
    photo = c.photo;

    txNickName.text = c.nickName!;
    txWork.text = c.work!;
    txEmail.text = c.email!;
    txWebsite.text = c.webSite!;
  }

  @action
  String? validateName(String? name) {
    String? _msg;
    if (name == null || name.isEmpty) {
      _msg = 'Nome não pode ser vazio';
    } else {
      _msg = null;
    }
    return _msg;
  }

  @action
  String? validatePhone(String? phone) {
    String? _msg;

    if (!maskFormatter.isFill()) {
      _msg = 'Preencha o telefone';
    } else if (phone == null || phone.isEmpty) {
      _msg = 'Telefone não pode ser vazio';
    } else {
      _msg = null;
    }
    return _msg;
  }

  Future<void> saveContact() async {
    try {
      String base64Image = '';
      if (photo is File) {
        List<int> imageBytes = photo.readAsBytesSync();
        base64Image = base64Encode(imageBytes);
      }
      contact.name = txName.text;
      contact.phoneNumber = maskFormatter.getMaskedText();
      contact.photo = base64Image == '' ? photo : base64Image;
      contact.isFavorite = contact.id == null ? false : contact.isFavorite;
      contact.nickName = txNickName.text;
      contact.webSite = txWebsite.text;
      contact.work = txWork.text;
      contact.email = txEmail.text;
      contact.active = true;
      contact.wasSync = false;

      if (base64Image.isNotEmpty) {
        photo = base64Decode(base64Image);
      }

      if (contact.id == null) {
        await _storage.addContact(contact);
      } else {
        await _storage.putContact(contact);
      }

      Utils.instance.showToast('Contato salvo com sucesso!');

      Modular.to.pop({'loadContacts': true});
    } catch (e) {
      Utils.instance.showToast('ocorreu um erro ao salvar o contato');
      print(e.toString());
    }
  }
}
