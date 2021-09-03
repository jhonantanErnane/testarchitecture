import 'package:flutter_modular/flutter_modular.dart';

import '../models/contact.dart';
import '../models/server_error.dart';
import '../services/sync_log_service.dart';
import '../custom_dio/custom_dio_builder/custom_dio_builder.dart';
import '../repositories/repository_interface.dart';

class ContactService extends Disposable {
  final _storage = Modular.get<ILocalRepository>();
  final _syncLogService = Modular.get<SyncLogService>();

  Future<Contact> sendContact(int contactId) async {
    try {
      Contact? contact = await _storage.getContact(contactId);
      if (contact != null) {
        if (contact.idServer == null) {
          return await _postContact(contact);
        } else {
          return await _putContact(contact);
        }
      }
      return Contact();
    } catch (e) {
      return Contact();
    }
  }

  Future<Contact> _postContact(Contact contact) async {
    try {
      final resp = await CustomDioBuilder.instance
          .post()
          .path('/contacts')
          .params()
          .data(contact.toJson())
          .run();
      return Contact.fromJson(resp.data);
    } catch (e) {
      // final serverError = ServerError.fromJson(e.response.data);
      // serverError.errorsMessage
      //     .forEach((element) => _syncLogService.setSyncLog(element.message));
      return Contact();
      // throw Exception(
      //     'Ops ocorreu um erro, ao sincronizar um contato, por favor tente novamente');
    }
  }

  Future<Contact> _putContact(Contact contact) async {
    try {
      final resp = await CustomDioBuilder.instance
          .put()
          .path('/contacts')
          .params()
          .data(contact.toJson())
          .run();
      return Contact.fromJson(resp.data);
    } catch (e) {
      print(e);
      throw Exception(
          'Ops ocorreu um erro, ao sincronizar um contato, por favor tente novamente');
    }
  }

  getAllContacts() async {
    try {
      final resp =
          await CustomDioBuilder.instance.get().path('/contacts').run();
      print(resp);
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {}
}
