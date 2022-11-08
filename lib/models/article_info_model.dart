


import 'package:tecblog/constant/api_constant.dart';

class ArticleInfoModel{

        String? id;
        String?title;
        String?content;
        String?image;
        String?catId;
        String?catName;
        String?author;
         String?view; 
         String?status;
         String?createdAt;
          bool? isFavorite;
             
          ArticleInfoModel(
        this.title,
        this.content,
        this.image,
          );


          ArticleInfoModel.fromJson(Map<String,dynamic>element){
           
           var info = element['info'];
           id = info['id'];
            title = info['title'];
            content = info['content'];
            image =ApiConstant.hostDlUrl + info['image'];
            catId = info['catId'];
            catName = info['catName'];
            author = info['author'];
            view = info['view'];
            status = info['status'];
            createdAt = info['createdAt'];
            isFavorite = element['isFavorite'];
          }


}


