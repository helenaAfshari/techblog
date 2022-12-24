import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:tecblog/Services/dio_service.dart';
import 'package:tecblog/constant/api_constant.dart';
import 'package:tecblog/models/podcast_file_model.dart';

class SinglePodcastController extends GetxController{

var id;
SinglePodcastController({this.id});
RxBool loading = false.obs;
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


}