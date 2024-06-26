class PostModel {
  int id;
  String about;
  int likes;
  int comments;
  DateTime createdAt;
  String connection;
  User user;

  PostModel({
    required this.id,
    required this.about,
    required this.likes,
    required this.comments,
    required this.createdAt,
    required this.connection,
    required this.user,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json["id"],
        about: json["about"],
        likes: json["likes"],
        comments: json["comments"],
        createdAt: DateTime.parse(json["created_at"]),
        connection: json["connection"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "about": about,
        "likes": likes,
        "comments": comments,
        "created_at": createdAt.toIso8601String(),
        "connection": connection,
        "user": user.toJson(),
      };
}

class User {
  String profileLink;
  String name;
  String occupation;

  User({
    required this.profileLink,
    required this.name,
    required this.occupation,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        profileLink: json["profile_link"],
        name: json["name"],
        occupation: json["occupation"],
      );

  Map<String, dynamic> toJson() => {
        "profile_link": profileLink,
        "name": name,
        "occupation": occupation,
      };
}
