import 'package:movie_detail_flutter_sample/model/movie_model.dart';
import 'package:flutter/material.dart';

class MovieArtistsWidget extends StatelessWidget {
  MovieArtistsWidget(this.movie);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 16.0, bottom: 8.0, top: 16.0),
          child: Text(
            "演员",
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        SizedBox.fromSize(
          size: const Size.fromHeight(120.0),
          child: _ArtistListView(movie),
        ),
        SizedBox(
          height: 16.0,
        )
      ],
    );
  }
}

class _ArtistListView extends StatefulWidget {
  _ArtistListView(this.movie);

  final Movie movie;

  @override
  State<StatefulWidget> createState() => _ArtistListState();
}

class _ArtistListState extends State<_ArtistListView> {
  Widget _buildPhotoItem(BuildContext context, int index) {
    var actor = widget.movie.actors[index];
    var count = widget.movie.actors.length;
    return Padding(
      padding: EdgeInsets.only(
          left: index == 0 ? 16.0 : 8.0,
          right: index == count - 1 ? 16.0 : 0.0),
      child: Column(
        children: <Widget>[
          Container(
            width: 80.0,
            height: 80.0,
            child: CircleAvatar(
              backgroundImage: AssetImage(actor.avatarUrl),
              radius: 50.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(actor.name),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var actorDataList = widget.movie.actors;
    var count = actorDataList.length;
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: count,
        itemBuilder: _buildPhotoItem);
  }
}
