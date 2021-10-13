import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:project/model/comment.dart';

Future<List<Comment>> fetchList() async {
  final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/junsuk5/mock_json/main/conferences.json'));

  if (response.statusCode == 200) {
    Iterable jsonResponse = convert.jsonDecode(response.body);
    return jsonResponse.map((comment) => Comment.fromJson(comment)).toList();
  }

  throw Exception('Error');
}
