import 'package:risky_coin/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json, String documentId) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': super.id,
      'name': super.name,
      'email': super.email,
      'phone': super.phone,
      'address': super.address,
    };
  }
}