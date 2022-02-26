import 'dart:convert';
import 'dart:async';
import 'package:provider_exam/src/models/movie.dart';
import 'package:http/http.dart' show Client, Response;

class MovieRepository {
  Client client = Client();
  final _baseUrl = 'api.themoviedb.org';
  final query = {'api_key': 'afca554b4c79ae5b98c21d3684de4937'};

  Future<List<Movie>> loadMovies() async {
    var uri = Uri.https(_baseUrl, "/3/movie/popular", query);
    Response response = await client.get(uri);

    Map<String, dynamic> body = json.decode(response.body);
    if (body["results"] != null) {
      List<dynamic> list = body["results"];
      return list.map<Movie>((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
