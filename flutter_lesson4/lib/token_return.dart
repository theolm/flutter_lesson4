// To parse this JSON data, do
//
//     final tokenReturn = tokenReturnFromJson(jsonString);

import 'dart:convert';

TokenReturn tokenReturnFromJson(String str) => TokenReturn.fromJson(json.decode(str));

String tokenReturnToJson(TokenReturn data) => json.encode(data.toJson());

class TokenReturn {
  bool success;
  int code;
  String message;
  TokenData data;

  TokenReturn({
    this.success,
    this.code,
    this.message,
    this.data,
  });

  factory TokenReturn.fromJson(Map<String, dynamic> json) => TokenReturn(
    success: json["success"],
    code: json["code"],
    message: json["message"],
    data: TokenData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "code": code,
    "message": message,
    "data": data.toJson(),
  };
}

class TokenData {
  String accessToken;
  int expiresIn;
  String tokenType;
  String scope;
  String refreshToken;
  DateTime expires;
  int expiresTimestamp;

  TokenData({
    this.accessToken,
    this.expiresIn,
    this.tokenType,
    this.scope,
    this.refreshToken,
    this.expires,
    this.expiresTimestamp,
  });

  factory TokenData.fromJson(Map<String, dynamic> json) => TokenData(
    accessToken: json["access_token"],
    expiresIn: json["expires_in"],
    tokenType: json["token_type"],
    scope: json["scope"],
    refreshToken: json["refresh_token"],
    expires: DateTime.parse(json["expires"]),
    expiresTimestamp: json["expires_timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "expires_in": expiresIn,
    "token_type": tokenType,
    "scope": scope,
    "refresh_token": refreshToken,
    "expires": expires.toIso8601String(),
    "expires_timestamp": expiresTimestamp,
  };
}