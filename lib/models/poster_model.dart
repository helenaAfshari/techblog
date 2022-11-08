

import 'package:tecblog/constant/api_constant.dart';

class PosterModel{

  String? id;
  String? title;
  String? image;

 PosterModel({
     
      this.id,
      this.image,
     this.title,
 });

 PosterModel.fromJason(Map<String, dynamic> element){

  id = element["id"];
  image =ApiConstant.hostDlUrl+ element["image"];
  title =element["title"];
  
 }
}