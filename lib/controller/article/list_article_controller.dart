import 'package:get/get.dart';
import 'package:tecblog/Services/dio_service.dart';
import 'package:tecblog/constant/api_constant.dart';
import 'package:tecblog/models/article_model.dart';

class ListArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getList();
  }

  getList() async {
    loading.value = true;
    //TODO get userid from getStorage ApiConstant.getArticleList+userid
    var response = await DioService().getMethod(ApiConstant.getArticleList);

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      loading.value = false; 
    }
  }


  getArticleListWithTagsId(String id) async {
    articleList.clear();
    loading.value = true;
    
    final queryParam = {
      'command':'get_articles_with_tag_id',
      'tag_id':id,
      'user_id':'',
    };
    final uri = Uri.https(ApiConstant.baseUrl,'article/get.php',queryParam);
    //TODO get userid from getStorage ApiConstant.getArticleList+userid
    var response = await DioService().getMethod(uri.toString());

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });

      loading.value = false;

    }
  }

 
}