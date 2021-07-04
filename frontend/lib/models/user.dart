import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class User {
  final String username;
  final String displayName;
  final bool isAdmin;

  User({
    required this.username,
    required this.displayName,
    this.isAdmin = false,
  });

  static User? fromCookie(String cookie) {
    final payload = cookie.split(".")[0];
    final Map<String, dynamic> parsedPayload =
        JsonDecoder().convert(utf8.decode(base64Decode(payload)));
    return User(
      username: parsedPayload["username"],
      displayName: parsedPayload["display_name"],
      isAdmin: parsedPayload["is_admin"],
    );
  }
}
