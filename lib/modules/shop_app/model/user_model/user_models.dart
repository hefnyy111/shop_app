// modules/shop_app/model/user_model/user_models.dart
import 'dart:convert';

class ShopUserModel {
  String name;
  String birthday;
  String emailaddress;
  String password;
  String phone;
  String uId;
  String photo;
  ShopUserModel({
    required this.name,
    required this.birthday,
    required this.emailaddress,
    required this.password,
    required this.phone,
    required this.uId, 
    required this.photo
  });

  factory ShopUserModel.fromJson(Map<String, dynamic> json) {
    return ShopUserModel(
      name: json['name'],
      birthday: json['birthday'],
      emailaddress: json['email'],
      password: json['password'],
      phone: json['phone'],
      uId: json['uId'], 
      photo: json['image']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'birthday': birthday,
      'image': photo,
      'email': emailaddress,
      'password': password,
      'phone': phone,
      'uId': uId,
    };
  }
}
