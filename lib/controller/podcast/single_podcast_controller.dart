
import 'package:get/get.dart';
import 'package:tecblog/Services/dio_service.dart';
import 'package:tecblog/constant/api_constant.dart';
import 'package:tecblog/models/podcast_file_model.dart';




class SinglePodcastController extends GetxController{
 var id;
  SinglePodcastController({this.id});
  RxBool loading = false.obs;

  Rx<PodcastFileModel>podcastFileModel = PodcastFileModel().obs;
  RxList<PodcastFileModel>podcastFileList = RxList();

  getPodcastFile() async {
    loading.value=true;

    var response = await DioService().getMethod(ApiConstant.podcastFile+id);
    if(response.statuseCode==200){
      for (var element in response.data["files"]) {
        podcastFileList.add(PodcastFileModel.fromJson(element));
      }
      loading.value =false;
    }

  }
}