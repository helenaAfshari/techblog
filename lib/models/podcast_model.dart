


import 'package:tecblog/constant/api_constant.dart';

class PodcastModel{

   String? id;
   String? title;
   String? poster;
   String? publisher;
   String? view;
   String?createdAt;
   
   PodcastModel(
    this.poster,
   );


   PodcastModel.fromJson(Map<String, dynamic> element){
   
      id  = element["id"];
      title = element["title"];
      poster =ApiConstant.hostDlUrl + element["poster"];
      publisher = element["author"];
      view = element["view"];
      createdAt = element["created_at"];

   }


}
