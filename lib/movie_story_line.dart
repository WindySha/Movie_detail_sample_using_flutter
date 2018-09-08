import 'package:flutter/material.dart';
import 'package:movie_detail_flutter_sample/model/movie_model.dart';

class MovieStoryLineWidget extends StatefulWidget {
  MovieStoryLineWidget(this.movie);

  final Movie movie;

  @override
  State<StatefulWidget> createState() => StoryLineState();
}

class StoryLineState extends State<MovieStoryLineWidget> {

  int _storyMaxLine = 3;

  bool isFolded = true;  //是否是折叠状态

  void _clicedkMoreBtn() {
    print("onTaped");
    setState(() {
      if (!isFolded) {
        _storyMaxLine = 3;
        isFolded = true;
      } else {
        _storyMaxLine = 50;
        isFolded = false;
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String stateTip;
    IconData icon;
    if (isFolded) {
      stateTip = "more";
      icon = Icons.keyboard_arrow_down;
    } else {
      stateTip = "less";
      icon = Icons.keyboard_arrow_up;
    }
    return Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "简介",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              widget.movie.storyline,
              style: TextStyle(color: Colors.black45, fontSize: 16.0),
              maxLines: _storyMaxLine,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 6.0,
            ),
            GestureDetector(
              onTap: _clicedkMoreBtn,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    stateTip,
                    style: TextStyle(fontSize: 14.0, color: Colors.red),
                  ),
                  Icon(
                    icon,
                    size: 18.0,
                    color: Colors.red,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
