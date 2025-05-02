import 'dart:convert';
import 'package:http/http.dart' as http;

class UnsplashService {
  static const _accessKey = 'hi1P8YqznEGLreLcTurIf5zvz4YEz3ovuwJ6CNOpEW4';
  static const _baseUrl = 'https://api.unsplash.com/photos/random';

  static Future<String> fetchImage(String city, String country) async {
    final refinedQuery = "$city $country landscape";
    final response = await http.get(Uri.parse(
        '$_baseUrl?query=$refinedQuery&orientation=landscape&client_id=$_accessKey'));

    if (response.statusCode != 200) {
      throw Exception('Unable to load photo.');
    }

    final data = json.decode(response.body);

    if (!data.containsKey('urls') || data['urls']['regular'] == null) {
      throw Exception('Unable to load photo.');
    }

    return data['urls']['regular'];
  }
}
