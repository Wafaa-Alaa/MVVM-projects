class UserModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  UserModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }
}