import 'dart:convert';

class AuthResponseModel {
    final User user;
    final String token;

    AuthResponseModel({
        required this.user,
        required this.token,
    });

    factory AuthResponseModel.fromRawJson(String str) => AuthResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AuthResponseModel.fromJson(Map<String, dynamic> json) => AuthResponseModel(
        user: User.fromJson(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
    };
}

class User {
    final int id;
    final String name;
    final String email;
    final dynamic emailVerifiedAt;
    final dynamic phone;
    final String role;
    final dynamic image;
    final DateTime createdAt;
    final DateTime updatedAt;

    User({
        required this.id,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.phone,
        required this.role,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
    });

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        phone: json["phone"],
        role: json["role"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "phone": phone,
        "role": role,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
