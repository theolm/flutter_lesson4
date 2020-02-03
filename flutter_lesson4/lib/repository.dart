import 'dart:convert';
import 'ru_return.dart';
import 'package:http/http.dart' as http;

import 'tickets_return.dart';
import 'token_return.dart';

const String _client_id = 'ad4ab230b4b4ee58d7fb9c93de6e729e';
const String _client_secret =
    '4889c0e9d9e31a062f34f1eb21aef961e198f3bff030650cf2117fdfe9ca4d136af7f74b9e9a5775';
const String _grant_type = 'password';
const String _scope = 'meus-dados';
var accessToken;

Future<bool> apiLogin(String user, String password) async {
  var url = 'https://api.ufrgs.br/v1/token';
  var response = await http.post(
    url,
    body: {
      'client_id': _client_id,
      'client_secret': _client_secret,
      'grant_type': _grant_type,
      'scope': _scope,
      'username': user,
      'password': password,
    },
  );

  print(response.body);

  if(response.statusCode == 200) {
    var tokenResponse = tokenReturnFromJson(response.body);
    accessToken = tokenResponse.data.accessToken;
    print(accessToken);
    return true;
  } else {
    return false;
  }
}

Future<List<RuReturn>> getMenuAsync() async {
  var url = 'https://www1.ufrgs.br/WS/siteUFRGS/getCardapioRU?v=10';
  var response = await http.get(url);
  try {

    var map = ruReturnFromJson(response.body);
    List<RuReturn> list = [];

    map.forEach((key, value) {
      list.add(value);
    });

    return list;
  } catch(e) {
    print(e);
  }
}

Future<List<Tiquete>> getTicketsAsync() async {
  if(accessToken == null) {
    print('Sem token');
    return null;
  }


  var url = 'https://api.ufrgs.br/v1/r-u-tiquetes/disponiveis';
  var response = await http.get(url, headers: {
    'authorization': 'Bearer $accessToken'
  });

  print(response.body);

  try {
    var tickets = ticketsReturnFromJson(response.body).data.tiquetes;
    return tickets;
  } catch(e) {
    print(e);
    return null;
  }

}