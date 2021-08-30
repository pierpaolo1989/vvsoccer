import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:soccer/models/VideoContent.dart';

class VideoDetails extends StatelessWidget {
  final VideoContent videoContent;
  VideoDetails(this.videoContent);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          videoContent.title,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8),
                child: Image.network(videoContent.thumbnail),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(videoContent.title),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(videoContent.competition),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(videoContent.date.substring(0, 10)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
