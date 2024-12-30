class UserModels {
  //Constructor
  UserModels({
    required this.id,
    required this.email,
    required this.name,
  });

  final String id;
  final String email;
  final String name;

  factory UserModels.fromMap(Map<String, dynamic> map) {
    print('INI MODEL USER');
    return UserModels(
      id: map['id'] as String? ?? '',
      email: map['email'] as String? ?? '',
      name: map['name'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
    };
  }
}
