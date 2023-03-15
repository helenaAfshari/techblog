import 'package:get/get.dart';
import 'package:tecblog/route_manager/binding.dart';
import 'package:tecblog/main.dart';
import 'package:tecblog/route_manager/names.dart';
import 'package:tecblog/view/Splash_screen.dart';
import 'package:tecblog/view/articles/manage_article.dart';
import 'package:tecblog/view/articles/single.dart';
import 'package:tecblog/view/articles/single_manage_article.dart';
import 'package:tecblog/view/main_screen/main_screen.dart';
import 'package:tecblog/view/podcast/podcast_list.dart';
import 'package:tecblog/view/podcast/single_podcast.dart';

class Pages{

  Pages._();

  static List<GetPage<dynamic>>  pages =  [
          GetPage(
              name: NamedRoute.initialRoute,
              page: () => const SplashScreen(),
             ),
          GetPage(
              name: NamedRoute.routeMainScreen,
              page: () => MainScreen(),
              binding: RegisterBinding()),
          GetPage(
              name: NamedRoute.routeSingleArticle,
              page: () => Single(),
              binding: ArticleBinding()),
          GetPage(
              name: NamedRoute.routemanageArticle,
              page: () => ManageArticleScreen(),
              binding: ArticleManagerBinding()),
          GetPage(
              name: NamedRoute.singleManageArticle,
              page: () => SingleManageArticle(),
              binding: ArticleManagerBinding()),
          GetPage(
              name: NamedRoute.singlePodcast,
              page: () => PodcastSingle(),
              
              ),
               GetPage(
              name: NamedRoute.podcastList,
              page: () => HotPodcastList(title: '',),
              binding: SinglePodcastBinding(),
              ),

        ];


}