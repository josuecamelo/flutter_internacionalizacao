import 'dart:convert';

import 'package:bytebank/http/webclient.dart';
import 'package:http/http.dart';

const String MESSAGES_URI = 'https://gist.githubusercontent.com/josuecamelo/b48473dc8be963be88b565638a587299/raw/6763f9b95d02b3d672b2117151617d7f389a464d/i18n.json';

class I18NWebClient {
  Future<Map<String, dynamic>> findAll() async {
    final Response response =
    await client.get(MESSAGES_URI);
    final Map<String, dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson;
  }
}