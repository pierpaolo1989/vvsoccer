class Video {
  
  late String title;
  late String embed;

Video(this.title, this.embed);


 Video.fromMap(Map<String, dynamic> mappa){
      this.title = mappa['title'];
      this.embed = mappa['embed'];
   }
}