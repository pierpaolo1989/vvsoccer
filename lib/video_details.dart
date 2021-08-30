import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:soccer/models/VideoContent.dart';

class VideoDetails extends StatelessWidget {
  final VideoContent videoContent;
  VideoDetails(this.videoContent);

  final _htmlContent = """
  <div style='width:100%;height:0px;position:relative;padding-bottom:56.250%;'><iframe src='https:\/\/www.scorebat.com\/embed\/v\/6128c4483364d\/?utm_source=api&utm_medium=video&utm_campaign=v3' frameborder='0' width='100%' height='100%' allowfullscreen allow='autoplay; fullscreen' style='width:100%;height:100%;position:absolute;left:0px;top:0px;overflow:hidden;'><\/iframe><\/div>
  """;

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
              Padding(
                padding: EdgeInsets.all(8),
                child: Html(data: _htmlContent),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
