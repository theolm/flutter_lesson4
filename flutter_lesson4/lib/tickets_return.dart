// To parse this JSON data, do
//
//     final ticketsReturn = ticketsReturnFromJson(jsonString);

import 'dart:convert';

TicketsReturn ticketsReturnFromJson(String str) => TicketsReturn.fromJson(json.decode(str));

String ticketsReturnToJson(TicketsReturn data) => json.encode(data.toJson());

class TicketsReturn {
  final bool success;
  final int code;
  final String message;
  final Data data;

  TicketsReturn({
    this.success,
    this.code,
    this.message,
    this.data,
  });

  factory TicketsReturn.fromJson(Map<String, dynamic> json) => TicketsReturn(
    success: json["success"],
    code: json["code"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "code": code,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  final List<Tiquete> tiquetes;
  final Links links;
  final Meta meta;

  Data({
    this.tiquetes,
    this.links,
    this.meta,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    tiquetes: List<Tiquete>.from(json["tiquetes"].map((x) => Tiquete.fromJson(x))),
    links: Links.fromJson(json["_links"]),
    meta: Meta.fromJson(json["_meta"]),
  );

  Map<String, dynamic> toJson() => {
    "tiquetes": List<dynamic>.from(tiquetes.map((x) => x.toJson())),
    "_links": links.toJson(),
    "_meta": meta.toJson(),
  };
}

class Links {
  final Self self;

  Links({
    this.self,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: Self.fromJson(json["self"]),
  );

  Map<String, dynamic> toJson() => {
    "self": self.toJson(),
  };
}

class Self {
  final String href;

  Self({
    this.href,
  });

  factory Self.fromJson(Map<String, dynamic> json) => Self(
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
  };
}

class Meta {
  final int totalCount;
  final int pageCount;
  final int currentPage;
  final int perPage;

  Meta({
    this.totalCount,
    this.pageCount,
    this.currentPage,
    this.perPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    totalCount: json["totalCount"],
    pageCount: json["pageCount"],
    currentPage: json["currentPage"],
    perPage: json["perPage"],
  );

  Map<String, dynamic> toJson() => {
    "totalCount": totalCount,
    "pageCount": pageCount,
    "currentPage": currentPage,
    "perPage": perPage,
  };
}

class Tiquete {
  final String nrtiquete;
  final String nrrefeicoestotal;
  final String nrrefeicoesresta;

  Tiquete({
    this.nrtiquete,
    this.nrrefeicoestotal,
    this.nrrefeicoesresta,
  });

  factory Tiquete.fromJson(Map<String, dynamic> json) => Tiquete(
    nrtiquete: json["nrtiquete"],
    nrrefeicoestotal: json["nrrefeicoestotal"],
    nrrefeicoesresta: json["nrrefeicoesresta"],
  );

  Map<String, dynamic> toJson() => {
    "nrtiquete": nrtiquete,
    "nrrefeicoestotal": nrrefeicoestotal,
    "nrrefeicoesresta": nrrefeicoesresta,
  };
}
