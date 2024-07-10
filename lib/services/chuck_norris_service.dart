import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/chuck_norris_joke.dart';

class ChuckNorrisService {
  static const String _baseUrl = 'https://api.chucknorris.io/jokes/random';

  Future<ChuckNorrisJoke> fetchJoke() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      return ChuckNorrisJoke.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load joke');
    }
  }
}
