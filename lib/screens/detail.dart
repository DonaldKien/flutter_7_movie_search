import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_7_movie_search/widgets/fetchDetailMovie.dart';

class DetailPage extends StatefulWidget {
  DetailPage({this.imdbId});
  final String imdbId;
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Detail detailList;
  @override
  void initState() {
    super.initState();
    fetchDetailApi(widget.imdbId).then((value) {
      setState(() {
        detailList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Detail'),
      ),
      body: Container(
        child: detailList == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: EdgeInsets.all(8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: <Widget>[
                      Image.network(detailList.poster),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          detailList.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(detailList.released),
                      Text(detailList.runtime),
                      Text(detailList.genre),
                      Text(
                        detailList.plot,
                        textAlign: TextAlign.center,
                      ),
                      Text(detailList.boxOffice),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

}


