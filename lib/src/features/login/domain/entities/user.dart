class User {
  final int id;
  final String accessToken;
  final String refreshToken;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String role;
  final String gender;
  User({
    required this.id,
    required this.accessToken,
    required this.refreshToken,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.role,
    required this.gender,
  });

  User copyWith({
    int? id,
    String? accessToken,
    String? refreshToken,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? role,
    String? gender,
  }) {
    return User(
      id: id ?? this.id,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      gender: gender ?? this.gender,
    );
  }
}
