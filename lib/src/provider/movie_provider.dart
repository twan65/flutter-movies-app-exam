import 'package:flutter/foundation.dart';
import 'package:provider_exam/src/repository/movie_repository.dart';

import '../models/movie.dart';

class MovieProvider extends ChangeNotifier {
  final MovieRepository _movieRepository = MovieRepository();
  List<Movie> _movies = [];

  List<Movie> get movies => _movies;

  loadMovies() async {
    List<Movie> movies = await _movieRepository.loadMovies();
    _movies = movies;
    notifyListeners();
  }
}
