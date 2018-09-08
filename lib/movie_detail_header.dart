import 'package:flutter/material.dart';
import 'package:movie_detail_flutter_sample/model/movie_model.dart';

class MovieDetailHeader extends StatelessWidget {
  MovieDetailHeader(this.movie);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
//    return TopBannerWidget(imageUrl: "images/banner.jpg",);
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 140.0),
          child: TopBannerWidget(
            imageUrl: movie.bannerUrl,
          ),
        ),
        Positioned(
          left: 16.0,
          right: 16.0,
          top: 200.0,
          child: _HeaderDetailWidget(movie),
        )
      ],
    );
  }
}

class TopBannerWidget extends StatelessWidget {
  TopBannerWidget({this.imageUrl});

  String imageUrl;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    print(" screenWidth = " + screenWidth.toString());
    print(" screenHeight = " + screenHeight.toString());

    return ClipPath(
      child: Image.asset(
        imageUrl,
        width: screenWidth,
        height: 250.0,
        fit: BoxFit.cover,
      ),
      clipper: _ImageCipper(),
    );
  }
}

class _ImageCipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double leftPadding = 20.0;
    double rightPadding = 22.0;
    var path = Path();
    path.lineTo(0.0, size.height - leftPadding);
    path.relativeQuadraticBezierTo(
        size.width / 4, leftPadding, size.width / 2, leftPadding);
    path.relativeQuadraticBezierTo(
        size.width / 4, 0.0, size.width / 2, -rightPadding);
    path.relativeLineTo(0.0, rightPadding - size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class _HeaderDetailWidget extends StatelessWidget {
  _HeaderDetailWidget(this.movie);

  Movie movie;

  ///创建电影分类的视图
  List<Widget> _buildCategoryChips(TextTheme textTheme) {
    return movie.categories.map((category) {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Chip(
          label: Text(category),
          labelStyle: textTheme.caption,
          backgroundColor: Colors.black12,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
//    return Text(
//      "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
//      style: TextStyle(fontSize: 30.0),
//    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Material(
          borderRadius: BorderRadius.circular(4.0),
          elevation: 2.0,
          child: Image.asset(
            movie.posterUrl,
            height: 180.0,
          ),
        ),
        SizedBox(width: 16.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                movie.title,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              _RatingInformation(movie),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildCategoryChips(textTheme),
              )
            ],
          ),
        )
      ],
    );
  }
}

class _RatingInformation extends StatelessWidget {
  _RatingInformation(this.movie);

  final Movie movie;

  Widget _buildRatingStars(int starCount) {
    var starList = <Widget>[];
    for (int i = 1; i <= 5; i++) {
      var starColor;
      if (i <= starCount) {
        starColor = Colors.red;
      } else {
        starColor = Colors.black12;
      }
      starList.add(Padding(
          padding: const EdgeInsets.only(right: 2.0),
          child: Icon(
            Icons.star,
            color: starColor,
          )));
    }
    return Row(children: starList);
    ;
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var ratingCaptionStyle = textTheme.caption.copyWith(color: Colors.black45);

    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              movie.rating.toString(),
              style: TextStyle(fontSize: 18.0, color: Colors.red),
            ),
            SizedBox(height: 4.0),
            Text(
              "评分",
              style: ratingCaptionStyle,
            ),
            SizedBox(height: 8.0),
          ],
        ),
        SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildRatingStars(movie.starRating),
            SizedBox(height: 4.0),
            Text(
              "星星",
              style: ratingCaptionStyle,
            ),
            SizedBox(height: 8.0),
          ],
        )
      ],
    );
  }
}
