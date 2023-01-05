import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:tecblog/Services/dio_service.dart';
import 'package:tecblog/constant/api_constant.dart';
import 'package:tecblog/models/podcast_file_model.dart';

class SinglePodcastController extends GetxController{

var id;
SinglePodcastController({this.id});
RxBool loading = false.obs;
RxBool isLoopAll = false.obs;
//list podcasts
RxList<PodcastFileModel> podcastFileList  = RxList();

late var playList ;
//برای این که پخش باشد tru
//وو اگر پخش نبود false
RxBool playState =  false.obs;
final player = AudioPlayer();

//این هم برای این که روی هر ایتم کلیک کردیم اون پادکست را بخواند
RxInt currentFileIndex = 0.obs;
@override
onInit()async{
  super.onInit();
  //داخل initگذاشتیم که 
  //که زمانی که مقداردهی میشود هر پادکستی که میخواهیم رامقداردهی میکند
  playList = ConcatenatingAudioSource(
    //که پادکست بعد را بخواند اتوماتیک
    useLazyPreparation: true,
    children: [],
    
    );
     await getPodcastFile(); 
     await player.setAudioSource(playList,initialIndex: 0,initialPosition: Duration.zero);

}

//لیست را پر کند برای ما
 getPodcastFile()async{
  loading.value = true;
  //برای اجرا رکویست یک ریسپانس میخواهم 

  //  به علت این که در پستمن Getهست 
  //اینجا هم از getMethodاستفاده میکنیم
  var response = await DioService().getMethod(ApiConstant.podcastFile+id);
   
  //چک میکنیم در پستمن کد 200هست 
  if(response.statusCode == 200){

    //اینجا باید تعدادی لیست یا ارایه باشد که اینجا از لیست استفاده میکنیم 
    //اینجا ما میگیم کلید فایلشو بده
    for (var element in response.data["files"] ) {
      //حالا اینجا یک لیست دارم میخوام پر کنم
      //هربار داخل پادکست فایل لیست اضافه میکنیم 
      podcastFileList.add(PodcastFileModel.fromJson(element));
      //هم زمان پلی لیست هم اجرا بشه
      //و با فایل هایی که از سرور میاد پرشون میکنیم 
      playList.add(AudioSource.uri(Uri.parse(PodcastFileModel.fromJson(element).file!)));

    }
    loading.value = false;
  }
 }

  
  //  RxDouble progressValue = 0.0.obs;
  //    startProgress(){
  //     const tick =Duration(seconds: 1);
  //     int duration = player.duration!.inSeconds;
  //     //اینجا درصد را حساب میکنیم
  //     //1توتال اون درصد هست
  //     var step = 1/duration;
  //     timer = Timer.periodic(tick, (timer) {
  //        duration--;
  //      //اضافه بشه جلوتر بیاد
  //         progressValue.value += step;
  //        //زمانی که تایمر ما کوچک تر مساوی صفرشده باشد تایمر ما کنسل شود
  //        if(duration <=0){
  //          timer.cancel();
  //        }

  //     },);
      
  //    }

  Rx<Duration>progressValue = Duration(seconds: 0).obs;
   Rx<Duration>bufferedValue = Duration(seconds: 0).obs;
   Timer?timer;

   startProgress(){
    //مشخص میکند که هرچند میلی یک بار کدمون را اجرا کند
    const tick = Duration(seconds: 1);
    //این هم duration کل تایمرمون هست
    int duration = player.duration!.inSeconds - player.position.inSeconds ;
   // این همونجایی میاد که سیک کردیم 
   // این تابع برای ممکن با جلو زدن سیک بار را تغییر بدیم یا با انتخاب کردن که میاد اول پروگرس بار را ریست کنیم
   //پس برای هر بار تغییر کردن باید تایمر را nullکنیم
   //به علت این که دوتا تایمر روی هم نیوفته و برناممون دچار باگ نباشه
   //که اون تایمرهای قبلی را پاک کند
    if(timer != null){
      if(timer!.isActive){
          timer!.cancel();
          timer = null;
      }
    }
      timer = Timer.periodic(tick, (timer) {
        //به صفر برسد با هربار اجرا
          duration--;
          //توی هر اجرایی که داری پوزیشن را که میدونیم در چه ثانیه ایی هست را به پروگرس بده
          progressValue.value=player.position;
          //اینجا هم بافرمون را میخواییم اپدیت کنیم که uiما آپدیت شود
          bufferedValue.value=player.bufferedPosition;
          //حالا کوچک تر مساوی صفر شد تایمر را کنسل کن
          //چون اینجا متوجه میشیم که موزیک تمام شده
          if(duration<=0){
           //کنسل میشود که از نو اجرا بشه اهنگ بعدی
            timer.cancel();
            //این دوتارا صفر میکنیم چون با کنسل شدن تایمر پروگرس و بافر برگردن به ابتدای اهنگ
            progressValue.value=Duration(seconds: 0);
            bufferedValue.value=Duration(seconds: 0);
          }
      },);
   }

   setLoopMode(){
     if(isLoopAll.value){
        isLoopAll.value=false;
        player.setLoopMode(LoopMode.off);
     }else{
      isLoopAll.value = true;
      player.setLoopMode(LoopMode.all);
     }
   }
}

