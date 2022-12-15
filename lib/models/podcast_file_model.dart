

import 'package:tecblog/constant/api_constant.dart';

class PodcastFileModel{

  String? id;
  String? podcastId;
  String? file;
  String? title;
  String? length;  

  PodcastFileModel();

  PodcastFileModel.fromJson(Map<String,dynamic>element){
    
 id= element["id"] ;
 podcastId= element["podcast_id"] ;
 file = ApiConstant.hostDlUrl+ element["file"];
 title= element["title"] ;
 length= element["length"];
  }
}