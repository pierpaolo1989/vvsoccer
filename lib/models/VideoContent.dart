import 'package:soccer/models/Video.dart';

class VideoContent {
  
  late String title;
  late String competition;
  late List<Video> videos;
  late String competitionUrl;
  late String date;
  late String matchviewUrl;
  late String thumbnail;

  VideoContent(this.competition, this.title, this.videos, this.competitionUrl, this.matchviewUrl, this.thumbnail, this.date);

 VideoContent.fromMap(Map<String, dynamic> mappa){
      this.title = mappa['title'];
      this.competition = mappa['competition'];
      this.date = mappa["date"];
      this.competitionUrl = mappa["competitionUrl"];
      this.thumbnail = mappa["thumbnail"];
      if(mappa["videos"]!=null){
         this.videos = List<Video>.from(mappa["videos"].map((i) => Video.fromMap(i)));
      }
   }
}