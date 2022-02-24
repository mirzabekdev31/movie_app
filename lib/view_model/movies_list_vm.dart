import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:movie_app/model/movie.dart';

class MoviesListViewModel extends ChangeNotifier {
    final String _apiKey= '&api_key=d877e0fd9c2ee1e6140535529ebeaaee';
    final String _host = 'https://api.themoviedb.org/3/movie/popular?';

    List<Movie> _movies=[];

    List<Movie> get moveis{
      return _movies;
    }


    Future<void> getFromApi() async {
      var uri = '$_host${_apiKey}&language=en-US&page=1';

      var url = Uri.parse(uri);
      final response = await http.get(url);

      final request = jsonDecode(response.body)['results'] as List;


      _movies= request.map((e) => Movie.fromJson(e)).toList();
      notifyListeners();
    }
}