import 'package:http/http.dart' as http;
import 'dart:convert';

class FetchMovie {
  Future<List<Movie>> fetchMovieApi(searchTitle) async {
    final response = await http.get(
        'http://www.omdbapi.com/?apikey=[ENTER API KEY]&s=$searchTitle');
    if (response.statusCode == 200) {
      return Movie.movieFromJson(json.decode(response.body));
    } else {
      print('Error fetching data: ${response.statusCode}');
      throw Exception('Failed to load album');
    }
  }
}

class Movie {
  final String title;
  final String year;
  final String imbdID;
  final String poster;
  Movie({this.title, this.year, this.imbdID, this.poster});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json["Title"],
      year: json['Year'],
      imbdID: json['imdbID'],
      poster: json['Poster'],
    );
  }

  static List<Movie> movieFromJson(dynamic json) {
    var searchResult = json['Search'];
    if (searchResult != null) {
      var results = List<Movie>();
      searchResult.forEach(
        (item) => results.add(Movie.fromJson(item)),
      );
      return results;
    }
    return List<Movie>();
  }
}
