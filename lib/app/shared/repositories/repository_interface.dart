import 'package:testarchitecture/app/shared/models/contact.dart';

abstract class ILocalRepository {
  /// Get the list of all contacts
  ///
  /// Optinal parameter [name], will filter in all contacts by name
  Future<List<Contact>>? getAllContacts([String name]);
  /// Get the list of all suggestions names when the user start typing
  Future<List<String>> searchAllContacts(String name);
  /// Save new Contact
  Future<void> addContact(Contact contact);
  /// Get a contact by id
  Future<Contact?> getContact(int id);
  /// Edit a contact 
  Future<void> putContact(Contact contact);
  /// Delete a contact by id
  Future<void> deleteContact(int id);
  /// Delete all contacts
  Future<void> delContacts();
  /// Get the contacts ids that wasn't sync
  Future<List<int>> getContactsNotSync();
  /// Get all contacts ids that's in the device
  Future<List<String>> getAllContactsIds();

}
