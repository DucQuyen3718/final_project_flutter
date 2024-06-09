class UserEntity {
  String? id;
  final String name;
  final String email;
  final String phone;
  final String address;

  UserEntity({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });
}