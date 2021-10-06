import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:project/model/comment.dart';

  final String Url =
    'https://raw.githubusercontent.com/junsuk5/mock_json/main/conferences.json';

Future<List<Comment>> fetchList() async {
  Uri url = Uri.parse(Url);
  final response = await http.get(url);

  if (response.statusCode == 200) {
    Iterable jsonResponse = convert.jsonDecode(response.body);
    return jsonResponse
        .map((comment) => Comment.fromJson(comment))
        .toList();
  }

  throw Exception('Error');
}
