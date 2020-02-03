// To parse this JSON data, do
//
//     final ruReturn = ruReturnFromJson(jsonString);

import 'dart:convert';

Map<String, RuReturn> ruReturnFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, RuReturn>(k, RuReturn.fromJson(v)));

String ruReturnToJson(Map<String, RuReturn> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class RuReturn {
  final String nome;
  final String cardapio;

  String get fixCardapio => cardapio.trim();

  RuReturn({
    this.nome,
    this.cardapio,
  });

  factory RuReturn.fromJson(Map<String, dynamic> json) => RuReturn(
    nome: json["nome"],
    cardapio: json["cardapio"],
  );

  Map<String, dynamic> toJson() => {
    "nome": nome,
    "cardapio": cardapio,
  };
}
