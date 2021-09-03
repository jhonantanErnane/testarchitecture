import 'dart:async';
import 'package:sqflite/sqflite.dart';

import '../../models/contact.dart';
import '../repository_interface.dart';

const String DBNAME = 'flutter_contacts.db';
const int DBVERSION = 1;
const String TABLECONTACTS = 'contacts';
// tb lista
const List<String> dbCreate = [
  '''CREATE TABLE contacts(
      id INTEGER PRIMARY KEY,
      name TEXT,
      nickName TEXT,
      work TEXT,
      isFavorite INTEGER,
      photo TEXT,
      phoneNumber TEXT,
      email TEXT,
      idServer TEXT,
      wasSync INTEGER,
      active INTEGER,
      webSite TEXT)'''
];

class LocalRepositorySqlite implements ILocalRepository {
  Completer<Database> _dbInstance = Completer<Database>();

  LocalRepositorySqlite() {
    _init();
  }

  _init() async {
    var databasesPath = await getDatabasesPath();
    String path = databasesPath + '/' + DBNAME;
    // await deleteDatabase(path);
    Database db = await openDatabase(path,
        version: DBVERSION,
        onOpen: (Database db) {}, onCreate: (Database db, int version) async {
      dbCreate.forEach((String sql) async {
        try {
          await db.execute(sql);
        } catch (e) {
          print(e);
        }
      });
    });
    _dbInstance.complete(db);
  }

  @override
  Future<void> addContact(Contact contact) async {
    final dbInstance = await _dbInstance.future;
    try {
      await dbInstance.insert(TABLECONTACTS, contact.toSql());
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> delContacts() async {
    final dbInstance = await _dbInstance.future;
    dbInstance.delete(TABLECONTACTS);
  }

  /// Get all contacts
  ///
  /// Optinal parameter [name], will filter in all contacts by name
  @override
  Future<List<Contact>> getAllContacts([String? name]) async {
    try {
      final dbInstance = await _dbInstance.future;
      final contactsMap = await dbInstance.query(TABLECONTACTS);
      return contactsMap.map((e) => Contact.fromSql(e)).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<String>> searchAllContacts(String name) async {
    final dbInstance = await _dbInstance.future;
    try {
      final suggestionsMap = await dbInstance.query(TABLECONTACTS,
          columns: ['name'], where: 'name like ?', whereArgs: ['%$name%']);
      return suggestionsMap.map((e) => e['name'].toString()).toList();
    } catch (e) {
      print(e);
      return [''];
    }
  }

  @override
  Future<Contact?> getContact(int id) async {
    final dbInstance = await _dbInstance.future;
    try {
      final contactsMap = await dbInstance
          .query(TABLECONTACTS, where: 'id == ?', whereArgs: [id]);
      if (contactsMap.isNotEmpty) {
        return Contact.fromSql(contactsMap.single);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<void> putContact(Contact contact) async {
    final dbInstance = await _dbInstance.future;
    try {
      dbInstance.update(TABLECONTACTS, contact.toSql(),
          where: 'id == ?', whereArgs: [contact.id]);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> deleteContact(int id) async {
    final dbInstance = await _dbInstance.future;
    try {
      dbInstance.delete(TABLECONTACTS, where: 'id == ?', whereArgs: [id]);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<List<int>> getContactsNotSync() async {
    final dbInstance = await _dbInstance.future;
    try {
      final res = await dbInstance.query(TABLECONTACTS,
          columns: ['id'],
          where: 'wasSync IS NULL OR wasSync == ?',
          whereArgs: [0]);
      return res.map<int>((e) => e['id'] as int).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<List<String>> getAllContactsIds() async {
    final dbInstance = await _dbInstance.future;
    try {
      final result =
          await dbInstance.query(TABLECONTACTS, columns: ['idServer']);
      return result.map((e) => e['idServer'].toString()).toList();
    } catch (e) {
      print(e);
      return [''];
    }
  }
}
