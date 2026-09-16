class UserModel {
  final int id;
  final String name;
  final String user;
  final String role;
  final String? position; // มีเฉพาะตอน login
  final String? email;    // มีเฉพาะตอน login

  UserModel({
    required this.id,
    required this.name,
    required this.user,
    required this.role,
    this.position,
    this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      user: json['user'],
      role: json['role'],
      position: json['position'],
      email: json['email'],
    );
  }
}