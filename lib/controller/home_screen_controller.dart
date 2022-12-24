import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tecblog/Services/dio_service.dart';
import 'package:tecblog/constant/api_constant.dart';
import 'package:tecblog/models/article_model.dart';

import 'package:tecblog/models/poster_model.dart';
import 'package:tecblog/models/tags_model.dart';
import 'package:tecblog/models/podcast_model.dart';

class HomeScreenController extends GetxController {

  late Rx<PosterModel> poster = PosterModel().obs;

     RxList<TagsModel> tagsList = RxList();
    RxList<ArticleModel> topVisitedList = RxList();
    RxList<PodcastModel> topPodcast = RxList();
    RxBool loading = false.obs;
     
     @override
     onInit(){
      super.onInit();
      getHomeItems();
     }
//یک متد که اینارو برامون پر کند
//چون قرار ارتباط با سرور باشد از asyncاستفاده میکنم
  getHomeItems() async {
    loading.value=true;
    //اینجوری دسترسی پیدا میکنیم
    var response = await DioService().getMethod(ApiConstant.getHomeItems);

    if (response.statusCode == 200) {
      //اینجا اون لیست از mapرا به ما برگردونده
      response.data['top_visited'].forEach((element) {
        //اینجا قبلا برای تاپ ویزیتد یک مدل تعریف کردیم
        //لیستس از ArticleModelبا استفاده از  data
        topVisitedList.add(ArticleModel.fromJson(element));
      });
        response.data['top_podcasts'].forEach((element) {
       
        topPodcast.add(PodcastModel.fromJson(element));
      });

      response.data['tags'].forEach((element){

        tagsList.add(TagsModel.fromJason(element));
      }

      );


      poster.value = PosterModel.fromJason(response.data['poster']);
       loading.value = false;
    }
  }


  

}