import 'package:flutter/material.dart';
import 'package:movie_detail_flutter_sample/movie_photos_widget.dart';
import 'package:movie_detail_flutter_sample/model/movie_model.dart';
import 'package:movie_detail_flutter_sample/movie_detail_header.dart';
import 'movie_artists_widget.dart';
import 'movie_story_line.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MovieDetailHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MovieDetailHomePage extends StatelessWidget {
  MovieDetailHomePage({Key key, this.title}) : super(key: key);

  final String title;

  final Movie movie = MovieFacroty.getMovie();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MovieDetailHeader(movie),
            MovieStoryLineWidget(movie),
            MoviePhotosWidget(movie),
            MovieArtistsWidget(movie)
          ],
        ),
      ),
    );
  }
}
