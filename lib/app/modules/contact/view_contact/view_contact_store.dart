import 'dart:io';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:testarchitecture/app/shared/models/contact.dart';
import 'package:testarchitecture/app/shared/repositories/repository_interface.dart';
import 'package:url_launcher/url_launcher.dart';

part 'view_contact_store.g.dart';

class ViewContactStore = _ViewContactStoreBase with _$ViewContactStore;

abstract class _ViewContactStoreBase with Store {
  final _storage = Modular.get<ILocalRepository>();

  @observable
  bool existWhatsapp = false;

  @observable
  bool isFavorite = false;

  @observable
  Contact contact = Contact();

  _ViewContactStoreBase() {
    _init();
  }

  Future<void> _init() async {
    if (Modular.args!.params != null) {
      await getContact();
    }
  }

  @action
  Future<void> getContact() async {
    final respContact =
        await _storage.getContact(int.parse(Modular.args!.params['id']));
    if (respContact != null) {
      contact = respContact;
      isFavorite = contact.isFavorite;
    }
  }

  @action
  Future<void> toggleFavorite() async {
    contact.isFavorite = !contact.isFavorite;
    await _storage.putContact(contact);
    isFavorite = contact.isFavorite;
  }

  Future<void> getApps() async {
    try {
      existWhatsapp = await canLaunch(getUrlWhatsapp('', contact.phoneNumber!));
      // existWhatsapp = await FlutterLaunch.hasApp(name: 'whatsapp');
    } catch (err) {
      existWhatsapp = false;
    }
  }

  void whatsAppOpen(phoneNumber, message) async {
    launch(getUrlWhatsapp(message, phoneNumber));
  }

  String getUrlWhatsapp(String message, String phoneNumber) {
    final p =
        int.parse(('55' + phoneNumber).replaceAll(new RegExp(r'[^0-9]'), ''));
    if (Platform.isIOS) {
      return Uri.encodeFull('whatsapp://wa.me/$p/?text=$message');
    } else {
      return Uri.encodeFull('whatsapp://send?phone=$p&text=$message');
    }
  }

  textMe(String number) async {
    // Android
    String uri = "sms:$number";
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      // iOS
      String uri = "sms:$number";
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

  launchCaller(String number) async {
    String url = "tel:$number";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
