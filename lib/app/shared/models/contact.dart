import 'contact_model.dart';

class Contact {
  int? id;
  String? name;
  String? nickName;
  String? work;
  late bool isFavorite;
  String? photo;
  String? phoneNumber;
  String? email;
  String? webSite;
  String? idServer;
  late bool wasSync;
  late bool active;

  Contact({
    this.id,
    this.name,
    this.nickName,
    this.work,
    this.isFavorite = false,
    this.photo,
    this.phoneNumber,
    this.email,
    this.webSite,
    this.idServer,
    this.wasSync = false,
    this.active = false,
  });

  Contact.fromContactModel(ContactModel c) {
    this.id = c.id;
    this.name = c.name;
    this.nickName = c.nickName;
    this.work = c.work;
    this.isFavorite = c.isFavorite;
    this.photo = c.photo;
    this.phoneNumber = c.phoneNumber;
    this.email = c.email;
    this.webSite = c.webSite;
    this.idServer = c.idServer;
    this.wasSync = c.wasSync;
    this.active = c.active;
  }

  Contact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nickName = json['nickName'];
    work = json['work'];
    isFavorite = json['isFavorite'];
    photo = json['photo'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    webSite = json['webSite'];
    idServer = json['idServer'];
    wasSync = json['wasSync'];
    active = json['active'];
  }

  Contact.fromSql(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nickName = json['nickName'];
    work = json['work'];
    isFavorite = json['isFavorite'] == 1;
    photo = json['photo'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    webSite = json['webSite'];
    idServer = json['idServer'];
    wasSync = json['wasSync'] == 1;
    active = json['active'] == 1;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['nickName'] = this.nickName;
    data['work'] = this.work;
    data['isFavorite'] = this.isFavorite;
    data['photo'] = this.photo;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    data['webSite'] = this.webSite;
    data['idServer'] = this.idServer;
    data['wasSync'] = this.wasSync;
    data['active'] = this.active;
    return data;
  }

  Map<String, dynamic> toSql() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['nickName'] = this.nickName;
    data['work'] = this.work;
    data['isFavorite'] = this.isFavorite ? 1 : 0;
    data['photo'] = this.photo;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    data['webSite'] = this.webSite;
    data['idServer'] = this.idServer;
    data['wasSync'] = this.wasSync ? 1 : 0;
    data['active'] = this.active ? 1 : 0;
    return data;
  }
}
