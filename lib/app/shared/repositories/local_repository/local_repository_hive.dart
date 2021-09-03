import 'dart:async';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:testarchitecture/app/shared/models/contact.dart';
import 'package:testarchitecture/app/shared/models/contact_model.dart';

import '../repository_interface.dart';

class LocalStorageHive implements ILocalRepository {
  static const KEYBOX = 'contacts';
  Completer<Box<ContactModel>> _instance = Completer<Box<ContactModel>>();

  LocalStorageHive() {
    _init();
  }

  _init() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.registerAdapter<ContactModel>(ContactModelAdapter());
    var boxContact = await Hive.openBox<ContactModel>(KEYBOX);
    _instance.complete(boxContact);
  }

  @override
  Future<void> addContact(Contact contact) async {
    var boxContact = await _instance.future;
    boxContact.add(ContactModel.fromContact(contact));
  }

  @override
  Future<void> delContacts() async {
    var boxContact = await _instance.future;
    boxContact.deleteFromDisk();
  }

  /// Get all contacts
  ///
  /// Optinal parameter [name], will filter in all contacts by name
  @override
  Future<List<Contact>> getAllContacts([String? name]) async {
    var boxContact = await _instance.future;
    Map<dynamic, dynamic> raw = boxContact.toMap();
    List<Contact> contacts = List<Contact>.from([]);
    raw.forEach((key, value) {
      value.id = key;
      contacts.add(Contact.fromContactModel(value));
    });
    if (name != null) {
      contacts = contacts.where((contact) {
        return contact.name!.toLowerCase().contains(name.toLowerCase());
      }).toList();
    }
    return contacts;
  }

  @override
  Future<List<String>> searchAllContacts(String name) async {
    List<Contact> listContacts = await getAllContacts(name);

    List<String> suggestions = listContacts.map<String>((e) {
      if (e.name == null) {
        return '';
      }
      return e.name!;
    }).toList();
    return suggestions;
  }

  @override
  Future<Contact> getContact(int id) async {
    var boxContact = await _instance.future;
    return Contact.fromContactModel(boxContact.get(id)!);
  }

  @override
  Future<void> putContact(Contact contact) async {
    var boxContact = await _instance.future;
    return await boxContact.putAt(
        contact.id!, ContactModel.fromContact(contact));
  }

  @override
  Future<void> deleteContact(int id) async {
    var boxContact = await _instance.future;
    boxContact.deleteAt(id);
  }

  @override
  Future<List<int>> getContactsNotSync() {
    // TODO: implement getContactsNotSync
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getAllContactsIds() {
    // TODO: implement getAllContactsIds
    throw UnimplementedError();
  }
}
