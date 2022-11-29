
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tecblog/Services/dio_service.dart';
import 'package:tecblog/constant/api_constant.dart';
import 'package:tecblog/models/article_info_model.dart';
import 'package:tecblog/models/article_model.dart';
import 'package:tecblog/models/tags_model.dart';

class ManageArticleController extends GetxController{

  RxList<ArticleModel> articleList = RxList.empty();
   RxList<TagsModel> tagList = RxList.empty();
 RxBool loading = false.obs;
 TextEditingController titleTextEditingController = TextEditingController();

 Rx<ArticleInfoModel>articleInfoModel = ArticleInfoModel(
  'اینجا عنوان مقاله قرار میگیره ، یه عنوان جذاب انتخاب کن',
  """
   من متن و بدنه اصلی مقاله هستم ، اگه میخوای من رو ویرایش کنی و یه مقاله جذاب بنویسی ، نوشته آبی رنگ بالا که نوشته "ویرایش متن اصلی مقاله" رو با انگشتت لمس کن تا وارد ویرایشگر بشی
  """,
  "",

 ).obs;

  @override
  onInit(){
    super.onInit();
    getManageArticle();
  }
    
     
  getManageArticle()async{
      loading.value = true;
    //TODO get userid from getStorage ApiConstant.getArticleList+userid
    // var response = await DioService().getMethod(ApiConstant.PublishedByMe+GetStorage().read(StorageKey.userId));
        var response = await DioService().getMethod(ApiConstant.PublishedByMe+"1");

      
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
        loading.value=false;
      
    }
  }

  updateTitle(){
  articleInfoModel.update((val) {
    val!.title = titleTextEditingController.text;
  });

  }
  storeArticle(){
      
  }

  
}