import 'package:flutter_lesson4/token_return.dart';
import 'package:http/http.dart' as http;

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

  if(response.statusCode == 200) {
    var tokenResponse = tokenReturnFromJson(response.body);
    accessToken = tokenResponse.data.accessToken;
    print(accessToken);
    return true;
  } else {
    return false;
  }
}
