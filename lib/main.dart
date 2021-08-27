import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soccer/models/ResponseVideo.dart';
import 'package:soccer/models/VideoContent.dart';
import 'package:flutter_html/flutter_html.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<VideoContent> videos = [];
  var jsonData = null;
   final _htmlContent = """
  <div style='width:100%;height:0px;position:relative;padding-bottom:56.250%;'><iframe src='https:\/\/www.scorebat.com\/embed\/v\/6128c4483364d\/?utm_source=api&utm_medium=video&utm_campaign=v3' frameborder='0' width='100%' height='100%' allowfullscreen allow='autoplay; fullscreen' style='width:100%;height:100%;position:absolute;left:0px;top:0px;overflow:hidden;'><\/iframe><\/div>
  """;

  @override
  void initState() {
    getVideos();
    super.initState();
  }

  Future getVideos() async {
    await http.get(Uri.parse("https://www.scorebat.com/video-api/v3/")).then((res) {
      if(res.statusCode==200){
        jsonData = json.decode(res.body);
        ResponseVideo response = ResponseVideo.fromMap(jsonData);
        setState(() {
          videos = response.response;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VVSoccer"),
      ),
      body: Center(
        child: Container(
          child: ListView.builder(
              itemCount: videos.length,
              itemBuilder: (context, index) {
                return Card( //                           <-- Card widget
                child: Container(
                  child:
                     ListTile(
                       title: Text(videos[index].title),
                       subtitle: Text(videos[index].competition),
                       onTap:(){

                       },
                       leading:ConstrainedBox(
                         constraints: BoxConstraints(
                           minWidth: 144,
                           minHeight: 144,
                           maxWidth: 164,
                           maxHeight: 164,
                         ),
                         child: Html(
                           data: _htmlContent,
                         ),
                     ),
            ),
        )
                );
      },
    )
        )
      ),
    );
}

}
