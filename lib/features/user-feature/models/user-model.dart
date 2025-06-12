class UserModel {
  final String name;
  final String email;
  final String phone;
  final String website;
  final String companyName;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.website,
    required this.companyName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      website: json['website'] ?? '',
      companyName: json['company']?['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'website': website,
      'company': {
        'name': companyName,
      },
    };
  }
}