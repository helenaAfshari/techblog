
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tecblog/Services/dio_service.dart';
import 'package:tecblog/constant/api_constant.dart';
import 'package:tecblog/constant/storage_const.dart';
import 'package:tecblog/gen/assets.gen.dart';
import 'package:tecblog/main.dart';
import 'package:tecblog/route_manager/names.dart';
import 'package:tecblog/view/main_screen/main_screen.dart';
import 'package:tecblog/view/register/register_intro.dart';


class RegisterController extends GetxController{

    TextEditingController emailTextEditingController = TextEditingController();
    TextEditingController activeCodeTextEditingController = TextEditingController();
      var email = 'afshari.hln@gmail.com';
      // ignore: non_constant_identifier_names
      var user_id ='38';

    register()async{

      Map<String,dynamic> map = {
             
        'email': emailTextEditingController.text,
        'command': 'register'
      };

      var response = await DioService().postMethod(map, ApiConstant.postRegister);
       email = emailTextEditingController.text;
         user_id = response.data['user_id'];
      debugPrint(response.toString());

    }

      verify()async{

      Map<String,dynamic> map = {
             
        'email': email,
        'user_id':user_id,
        'code': activeCodeTextEditingController.text,
        'command':'verify',
      };


      //response: verified, user_id: 38, token: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjM4IiwiZW1haWwiOiJhZnNoYXJpLmhsbkBnbWFpbC5jb20ifQ.y8Zju0GUeWJ2RLMNF-XNm9DyN76T0f6cTzwMbqsdJFQ

       // ignore: avoid_print
       debugPrint(map.toString());
      var response = await DioService().postMethod(map, ApiConstant.postRegister);
     debugPrint(response.data.toString());
      
      var status = response.data['response'];


          switch(status){
            case 'verified':
           var box = GetStorage();
        box.write(StorageKey.token, response.data['token']);
        box.write(StorageKey.userId, response.data['user_id']);


        debugPrint("read::::"+box.read(StorageKey.token).toString());
        debugPrint("read:::::"+box.read(StorageKey.userId).toString());
              
       Get.offAll(MainScreen());
       
            break;
             case 'incorrect_code':
            Get.snackbar('خطا', 'کد فعال سازی غلط است');
            break;
             case 'expired':
            Get.snackbar('خطا', 'کد فعال سازی منقضی شده است');
            break;
            
          } 
    }
    //چک میکنیم که اگر از getStorage گرفتی اگر خالی بود برو صفحه ثبتنام و در غیر این صورت برو در ارسال پست
    togleLogin(){
         if(GetStorage().read(StorageKey.token) == null){
            Get.to(RegisterIntro());
         }else{
           routTowriteBottomSheet();
         }

     
    }

 

    routTowriteBottomSheet(){
          Get.bottomSheet(
              Container(
                height: Get.height/3,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(Assets.images.bot.path,height: 40,),
                          const SizedBox(width: 8,),
                          const Text("دونسته هات رو با بقیه به اشتراک بزار....")
                        ],
                      ),
                       const SizedBox(height: 8,),

                 const Text("""
                       فکر کن!! اینجا بودنت به این معناست که یک گیک 
                      گیک تکنولوژی هستی  دونسته هات رو با جامعه گیک های فارسی زبان به اشتراک بذار
                  """),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(NamedRoute.routemanageArticle);
                        },
                        child: Container(
                          color: Color.fromARGB(255, 253, 252, 251),
                          child: Row(
                            children: [
                              Image.asset(Assets.icons.writing.path,height: 32,),
                              const SizedBox(width: 8,),
                              const Text("مدیریت مقاله ها")
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () { 
                          Get.toNamed(NamedRoute.podcastList);
                        },
                        child: Container(
                          color: Color.fromARGB(255, 253, 253, 252),
                          child: Row(
                            children: [
                              Image.asset(Assets.icons.podcast.path,height: 32,),
                              const SizedBox(width: 8,),
                              const Text("مدیریت پادکست ها"),
                            ],
                          ),
                        ),
                      ),
                  ],
                  ),

                    ],
                  ),
                ),
              ),
            
          );
    }
}