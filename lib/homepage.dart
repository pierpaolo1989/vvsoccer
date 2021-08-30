import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soccer/models/ResponseVideo.dart';
import 'package:soccer/models/VideoContent.dart';
import 'package:soccer/video_details.dart';

class Homepage extends StatelessWidget {
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
  var jsonData;
  var icona = Icon(Icons.search);
  Widget widgetRicerca =
      Text("VVSoccer", style: TextStyle(color: Colors.white));

  @override
  void initState() {
    getVideos();
    super.initState();
  }

  Future getVideos() async {
    await http
        .get(Uri.parse("https://www.scorebat.com/video-api/v3/"))
        .then((res) {
      if (res.statusCode == 200) {
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
        actions: [
          IconButton(
              icon: icona,
              onPressed: () {
                setState(() {
                  if (this.icona.icon == Icons.search) {
                    this.icona = Icon(Icons.cancel);
                    this.widgetRicerca = TextField(
                      onSubmitted: (testoRicerca) => print(testoRicerca),
                      textInputAction: TextInputAction.search,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    );
                  } else {
                    setState(() {
                      this.icona = Icon(Icons.search);
                      this.widgetRicerca = Text("VVSoccer",
                          style: TextStyle(color: Colors.white));
                    });
                  }
                });
              }),
        ],
      ),
      body: Center(
          child: Container(
              child: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return Card(
              //                           <-- Card widget
              child: Container(
            child: ListTile(
              title: Text(videos[index].title),
              subtitle: Text(videos[index].competition),
              onTap: () {
                MaterialPageRoute route = MaterialPageRoute(
                    builder: (_) => VideoDetails(videos[index]));
                Navigator.push(context, route);
              },
              leading: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 144,
                  minHeight: 144,
                  maxWidth: 164,
                  maxHeight: 164,
                ),
                /*child: Html(
                  data: _htmlContent,
                ),*/
                child: Image.network(videos[index].thumbnail),
              ),
            ),
          ));
        },
      ))),
    );
  }
}
