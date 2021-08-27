import 'package:soccer/models/VideoContent.dart';

class ResponseVideo {
  late List<VideoContent> response;

   ResponseVideo(this.response);

   ResponseVideo.fromMap(Map<String, dynamic> mappa){
       if(mappa["response"]!=null){
         this.response = List<VideoContent>.from(mappa["response"].map((i) => VideoContent.fromMap(i)));
      }
   }
}