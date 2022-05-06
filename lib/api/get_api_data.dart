import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:tmdb_app/models/pop_movies.dart';

class GetApiData extends ChangeNotifier{
  List<PopMovies> _movieList = [];

  List<PopMovies> get moviesList => _movieList;

  Future<void> parsePopularMovies() async {
    const apiKey = '9298e8a38c480a7f5b58160f2dc63e57';
    final url = Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=$apiKey');
    try {
      final response = await http.get(url);
      var jsonData = json.decode(response.body);
      var movies = jsonData['results'] as List;
      _movieList = movies.map<PopMovies>((movie) => PopMovies.fromJson(movie)).toList();
      print(moviesList[1].originalTitle);
      // return moviesList;
    } catch (e) {
      print(e);
      // return _movieList = [];
    }
    notifyListeners();
  }
}