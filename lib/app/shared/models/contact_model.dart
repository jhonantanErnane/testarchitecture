import 'package:hive/hive.dart';

import 'contact.dart';

part 'contact_model.g.dart';

@HiveType(typeId: 0)
class ContactModel {
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? nickName;
  @HiveField(3)
  String? work;
  @HiveField(4)
  late bool isFavorite;
  @HiveField(5)
  String? photo;
  @HiveField(6)
  String? phoneNumber;
  @HiveField(7)
  String? email;
  @HiveField(8)
  String? webSite;
  @HiveField(9)
  String? idServer;
  @HiveField(10)
  late bool wasSync;
  @HiveField(11)
  late bool active;

  ContactModel({
    this.id,
    this.name,
    this.nickName,
    this.work,
    this.isFavorite = false,
    this.photo,
    this.phoneNumber,
    this.email,
    this.webSite,
  });

  ContactModel.fromContact(Contact c) {
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

  ContactModel.fromJson(Map<String, dynamic> json) {
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
}
