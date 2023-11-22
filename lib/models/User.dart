class User {
  final int id;
  final String name;
  final String lastName;
  final String email;
  final int age;
  final String gender;
  final String description;
  final double rankPoints;

  User({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.age,
    required this.gender,
    required this.description,
    required this.rankPoints,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int? ?? 0,
      name: json['name'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      age: json['age'] as int? ?? 0,
      gender: json['gender'] ?? '',
      description: json['description'] ?? '',
      rankPoints: json['rankPoints'] as double? ?? 0,
    );
  }
}
