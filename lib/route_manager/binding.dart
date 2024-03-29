
import 'package:get/get.dart';
import 'package:tecblog/controller/article/list_article_controller.dart';
import 'package:tecblog/controller/podcast/single_podcast_controller.dart';
import 'package:tecblog/controller/register_controller.dart';
import 'package:tecblog/controller/article/single_article_controller.dart';
import 'package:tecblog/view/articles/manage_article.dart';

import '../controller/article/manage_article_controller.dart';
import '../controller/podcast/manage_podcast_controller.dart';

class ArticleBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(ListArticleController());

    Get.lazyPut(() => SingleArticleController());
  }

}
class RegisterBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(RegisterController());
    
  }
}

class ArticleManagerBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

 Get.lazyPut(() => ManageArticleController());
   

  }

}

class podcastManagerBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

   //Get.put(SinglePodcastController());
    Get.lazyPut(() => SinglePodcastController());

  }

}