

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:tecblog/Services/dio_service.dart';
import 'package:tecblog/constant/api_constant.dart';
import 'package:tecblog/controller/file_controller.dart';

import 'package:tecblog/models/podcast_model.dart';

import '../../constant/storage_const.dart';
import '../../models/podcast_file_model.dart';

class ManagePodcastController extends GetxController{

  RxList<PodcastModel> podcastModel = RxList.empty();
  Rx <PodcastFileModel> podcastFileModel = PodcastFileModel("اسم پادکست اینجا قرار میگیره").obs;
  
   // var selectedTime = TimeOfDay.now().replacing(hour: 0,minute: 0).obs;
  RxBool loading = false.obs;
  TextEditingController titleTextEditingControllerMinute =TextEditingController();
    TextEditingController titleTextEditingControllerHour =TextEditingController();

  RxInt? input=0.obs;
  RxInt? inputHoure = 0.obs;
  RxBool isvisibleMinute = false.obs ;
  RxBool isvisibleHour = false.obs ;
  var userId = '';
   var catId = '';


  //Rx<PodcastModel> podcastInfoModel = PodcastModel().obs;
  // var _dateTime = DateTime.now().obs;
   
   @override
   onInit(){
    super.onInit();
  
   }
     
     
   titleUpdate()async{
     Map<String,dynamic>map={
       'title':titleTextEditingControllerMinute.text,
        'command':'store_title',
        'cat_id':catId,
        'user_id':userId,
     };
        var response = await DioService().postMethod(map, ApiConstant.postTitle);
        log(response.data.toString());
   }

// updateTitle(){
//   podcastFileModel.update((val) {
//   val!.title = titleTextEditingController.text;
//   });
// }


}