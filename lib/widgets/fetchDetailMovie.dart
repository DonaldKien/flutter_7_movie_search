import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Detail> fetchDetailApi(imdbId) async {
  final response = await http
      .get('http://www.omdbapi.com/?i=$imdbId&apikey=[ENTER API KEY]');

  if (response.statusCode == 200) {
    return Detail.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Detail {
  final String poster;
  final String title;
  final String released;
  final String runtime;
  final String genre;
  final String plot;
  final String boxOffice;

  Detail(
      {this.poster,
      this.title,
      this.released,
      this.runtime,
      this.genre,
      this.plot,
      this.boxOffice});

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      poster: json["Poster"],
      title: json["Title"],
      released: json["Released"],
      runtime: json["Runtime"],
      genre: json["Genre"],
      plot: json["Plot"],
      boxOffice: json["BoxOffice"],
    );
  }
}
