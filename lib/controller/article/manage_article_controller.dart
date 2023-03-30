
import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tecblog/Services/dio_service.dart';
import 'package:tecblog/constant/api_constant.dart';
import 'package:tecblog/constant/commands.dart';
import 'package:tecblog/constant/storage_const.dart';
import 'package:tecblog/controller/file_controller.dart';
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
        var response = await DioService().getMethod(ApiConstant.PublishedByMe + "1");
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
   

  storeArticle()async{ 
    var fileController = Get.find<FilePickerController>();
      loading.value = true;
      Map<String,dynamic> map = {
         ApiArticleKeyConstant.title : articleInfoModel.value.title,
         ApiArticleKeyConstant.content : articleInfoModel.value.content,
         ApiArticleKeyConstant.catId : articleInfoModel.value.catId,
         ApiArticleKeyConstant.tagList:"[]",
         ApiArticleKeyConstant.userId : GetStorage().read(StorageKey.userId) ,
         ApiArticleKeyConstant.image : await dio.MultipartFile.fromFile(fileController.file.value.path!),
         ApiArticleKeyConstant.command : Commands.store,
      };
      var response = await DioService().postMethod( map, ApiConstant.articlePost); 
      log(response.data.toString());
      loading.value = false;
  }

  
}