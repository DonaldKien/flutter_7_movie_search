import 'package:flutter/material.dart';
import 'package:flutter_7_movie_search/widgets/fetchMovie.dart';
import 'package:flutter_7_movie_search/screens/detail.dart';

class FilmList extends StatefulWidget {
  @override
  _FilmListState createState() => _FilmListState();
}

class _FilmListState extends State<FilmList> {
  final titleInput = TextEditingController();
  FetchMovie fetchMovie = FetchMovie();
  List<Movie> movies = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 10,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 7,
                child: TextField(
                  controller: titleInput,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter a search term',
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: FlatButton(
                  color: Colors.teal,
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Search',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    fetchMovie.fetchMovieApi(titleInput.text).then((newMovies) {
                      setState(() {
                        movies = newMovies;
                      });
                    });
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(2),
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: Image.network(movies[index].poster),
                    title: Text(movies[index].title),
                    subtitle: Text(movies[index].year),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return DetailPage(
                              imdbId: movies[index].imbdID,
                            );
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
