

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:tecblog/Services/dio_service.dart';
import 'package:tecblog/constant/api_constant.dart';
import 'package:tecblog/constant/commands.dart';
import 'package:tecblog/controller/file_controller.dart';

import 'package:tecblog/models/podcast_model.dart';

import '../../constant/storage_const.dart';
import '../../models/podcast_file_model.dart';

class ManagePodcastController extends GetxController{

   RxList<PodcastModel> podcastModel = RxList.empty();
   

   Rx<PodcastFileModel> podcastFileModel = PodcastFileModel("اسم پادکست اینجا قرار میگیره").obs;
   
   // var selectedTime = TimeOfDay.now().replacing(hour: 0,minute: 0).obs;
  RxBool loading = false.obs;
  TextEditingController titleTextEditingController =TextEditingController();
    TextEditingController titleTextEditingControllerHour =TextEditingController();
    TextEditingController titleTextEditingControllerMinute =TextEditingController();


  RxInt? input=0.obs;
  RxInt? inputHoure = 0.obs;
  RxBool isvisibleMinute = false.obs ;
  RxBool isvisibleHour = false.obs ;
  var userId = '';
   var catId = '';
   var id;


    @override
    onInit(){
      super.onInit(); 
       
    }

  //Rx<PodcastModel> podcastInfoModel = PodcastModel().obs;
  // var _dateTime = DateTime.now().obs;
   
 
     
     
  //  titleUpdate()async{
  //    Map<String,dynamic>map={
  //      'title':titleTextEditingController.text,
  //       'command':'store_title',
  //       'cat_id':catId,
  //       'user_id':userId,
  //    };
     
  //       var response = await DioService().postMethod(map, ApiConstant.postTitle);
  //       log(response.data.toString());
  //  }

updateTitle(){
  podcastFileModel.update((val) {
  val!.title = titleTextEditingController.text;
  });
}

    titlePodcast()async{
      
      loading.value = true;
      Map<String,dynamic> map={
         ApiPodcastTitleKyConstants.userId:GetStorage().read(StorageKey.userId),
         ApiPodcastTitleKyConstants.catId:catId,
         ApiPodcastTitleKyConstants.title:titleTextEditingController.text,
         ApiPodcastTitleKyConstants.command:Commands.storTitle,
      };
       var response = await DioService().postMethod(map, ApiConstant.postPodcast); 
       if(response.statusCode == 201){
         
       }

    }

     filePodcast()async{
      var fileController=Get.find<FilePickerController>();
      loading.value = true;
      Map<String,dynamic>map={
        ApiPodcastFileKyConstants.title:podcastFileModel.value.title,
        ApiPodcastFileKyConstants.file:await dio.MultipartFile.fromFile(fileController.file.value.path!),
        ApiPodcastFileKyConstants.podcastId:podcastFileModel.value.podcastId,
        ApiPodcastFileKyConstants.command:Commands.storFile,
        ApiPodcastFileKyConstants.length:podcastFileModel.value.length,

      };
     var response = await DioService().postMethod(map, ApiConstant.postPodcast); 

     }  
     
     UpdatePodcast()async{
   
      var fileController=Get.find<FilePickerController>();
      loading.value = true;
      Map<String,dynamic>map={
        ApiPodcastUpdateKyConstants.image:await dio.MultipartFile.fromFile(fileController.file.value.path!),
        ApiPodcastUpdateKyConstants.file:podcastFileModel.value.file,
        ApiPodcastUpdateKyConstants.podcastId:podcastFileModel.value.podcastId,
        ApiPodcastUpdateKyConstants.command:Commands.storUpdate,
        ApiPodcastUpdateKyConstants.userId:GetStorage().read(StorageKey.userId),
      };
     var response = await DioService().postMethod(map, ApiConstant.postPodcast); 
       
     }

}