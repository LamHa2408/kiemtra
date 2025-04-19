class User {
  int? id;
  String name;
  String email;
  String phone;
  String gender;
  DateTime dateOfBirth;
  String password;
  String? avatarUrl;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.dateOfBirth,
    required this.password,
    this.avatarUrl,
  });

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      gender: json['gender'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      password: json['password'],
      avatarUrl: json['avatarUrl'],
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'gender': gender,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'password': password,
      'avatarUrl': avatarUrl,
    };
  }
}
