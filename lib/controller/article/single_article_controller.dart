import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tecblog/Services/dio_service.dart';
import 'package:tecblog/constant/api_constant.dart';
import 'package:tecblog/models/article_info_model.dart';
import 'package:tecblog/models/article_model.dart';
import 'package:tecblog/models/tags_model.dart';
import 'package:tecblog/view/articles/single.dart';

class SingleArticleController extends GetxController {
  RxBool loading = false.obs;
  RxInt id = RxInt(0);
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel(null,null,null).obs;
  RxList<TagsModel> tagList = RxList();
  RxList<ArticleModel> releatedList = RxList();

  getArticleInfo(var id) async {
    articleInfoModel = ArticleInfoModel(null,null,null).obs;
     Get.to(Single());

    loading.value = true;
    var userId = '';
    debugPrint(ApiConstant.baseUrl +
        'article/get.php?command=info&id=$id&user_id=$userId');
    //TODO user id is hard code

    var response = await DioService().getMethod(ApiConstant.baseUrl +
        'article/get.php?command=info&id=$id&user_id=$userId');

    if (response.statusCode == 200) {
      articleInfoModel.value = ArticleInfoModel.fromJson(response.data);
       loading.value = false;

    }

    tagList.clear();
    response.data['tags'].forEach((element) {
      tagList.add(TagsModel.fromJason(element));
    });

    releatedList.clear();
    response.data['related'].forEach((element) {
      releatedList.add(ArticleModel.fromJson(element));

    });

    Get.to(Single());

  }
 
}