import 'package:get/get.dart';
import 'package:tecblog/Services/dio_service.dart';
import 'package:tecblog/constant/api_constant.dart';
import 'package:tecblog/models/podcast_file_model.dart';

class SinglePodcastController extends GetxController{

var id;
SinglePodcastController({this.id});
RxBool loading = false.obs;
//list podcasts
RxList<PodcastFileModel> podcastFileList  = RxList();


@override
onInit(){
  super.onInit();
     getPodcastFile(); 

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
    }
    loading.value = false;
  }
 }
}