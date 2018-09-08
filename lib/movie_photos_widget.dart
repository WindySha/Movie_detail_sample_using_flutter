import 'package:movie_detail_flutter_sample/model/movie_model.dart';
import 'package:flutter/material.dart';

class MoviePhotosWidget extends StatelessWidget {
  MoviePhotosWidget(this.movie);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
          child: Text(
            "剧照",
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        SizedBox.fromSize(
          size: const Size.fromHeight(100.0),
          child: _PhotosListView(movie),
        )
      ],
    );
  }
}

class _PhotosListView extends StatefulWidget {
  _PhotosListView(this.movie);

  final Movie movie;

  @override
  State<StatefulWidget> createState() => _PhotosListState();
}

class _PhotosListState extends State<_PhotosListView> {
  Widget _buildPhotoItem(String photoUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3.0),
      child: Image.asset(
        photoUrl,
        height: 120.0,
        width: 160.0,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var photoDataList = widget.movie.photoUrls;
    var count = photoDataList.length;
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: count,
        itemBuilder: (context, position) {
          return Padding(
              padding: EdgeInsets.only(
                  left: position == 0 ? 16.0 : 8.0,
                  right: position == count - 1 ? 16.0 : 0.0),
              child: _buildPhotoItem(photoDataList[position]));
        });
  }
}
