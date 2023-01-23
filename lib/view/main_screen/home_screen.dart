import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tecblog/constant/my_colors.dart';
import 'package:tecblog/constant/my_strings.dart';
import 'package:tecblog/component/mycomponent.dart';
import 'package:tecblog/controller/home_screen_controller.dart';
import 'package:tecblog/controller/article/single_article_controller.dart';
import 'package:tecblog/main.dart';
import 'package:tecblog/models/fake_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tecblog/route_manager/names.dart';
import 'package:tecblog/view/articles/article_list_screen.dart';
import 'package:tecblog/view/podcast/single_podcast.dart';
import '../../gen/assets.gen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  }) : super(key: key);

  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  SingleArticleController singleArticleController = Get.put(SingleArticleController());


  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          (() => Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: homeScreenController.loading.value == false
                    ? Column(
                        children: [
                          poster(),
                          const SizedBox(
                            height: 16,
                          ),

                          tags(),
                          const SizedBox(
                            height: 32,
                          ),

                          GestureDetector(
                            onTap: () => Get.to(ArticleListScreen(title: 'مقالات')),
                            child: SeeMoreBlog(
                                bodyMargin: bodyMargin, textTheme: textTheme, title: 'مشاهده داغ ترین نوشته ها',),
                          ),

                          topVisited(),

                          //hotPodcast
                          SeeMorePodcast(textTheme: textTheme),

                          SizedBox(
                            height: size.height / 29,
                          ),

                          //podcast

                          topPodcasts(),

                          const SizedBox(
                            height: 60,
                          ),
                        ],
                      )
                    : const loading(),
              )),
        ));
  }

  Widget topVisited() {
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
            itemCount: homeScreenController.topVisitedList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: () {
                  singleArticleController.getArticleInfo(
                      homeScreenController.topVisitedList[index].id);
                },
                child: Padding(
                  padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: size.height / 5.3,
                          width: size.width / 2.2,
                          child: CachedNetworkImage(
                            imageUrl: homeScreenController
                                .topVisitedList[index].image!,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 100),
                                child: SizedBox(
                                    height: 30,
                                    width: 20,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          homeScreenController
                                              .topVisitedList[index].author!,
                                          style: textTheme.headline5,
                                        ),
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        Text(
                                          homeScreenController
                                              .topVisitedList[index].view!,
                                          style: textTheme.headline5,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Icon(
                                          Icons.remove_red_eye_sharp,
                                          color: Colors.white,
                                          size: 20,
                                        )
                                      ],
                                    )),
                              ),
                            ),
                            placeholder: (context, url) =>
                                const SpinKitFadingCube(
                              color: SolidColors.prymaryColor,
                              size: 55,
                            ),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.image_not_supported_outlined,
                              size: 50,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          width: size.width / 2.4,
                          child: Text(
                            homeScreenController.topVisitedList[index].title!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
              );
            })),
      ),
    );
  }

  Widget topPodcasts() {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
          itemCount: homeScreenController.topPodcast.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(NamedRoute.singlePodcast,arguments: homeScreenController.topPodcast[index]);
              },
              child: Padding(
                padding:  EdgeInsets.only(right: index == 0 ? bodyMargin:15),
                child: Column(
                  children: [ 
                    SizedBox(
                      height: size.height / 7.5,
                      width: size.width / 3.1,
                      child: CachedNetworkImage(
                        imageUrl: homeScreenController.topPodcast[index].poster!,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16),
                              ),
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover)),
                        ),
                        placeholder: ((context, url) => const loading()),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.image_not_supported_outlined,
                          size: 50,
                          color: Color.fromARGB(255, 227, 10, 10),
                        ),
                      ),
                    ),
                    SizedBox(
                        width: size.width / 2.4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              homeScreenController.topPodcast[index].title!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            );
          })),
    );
  }

  Widget poster() {
    return Obx((() => Stack(
          children: [
            Container(
              width: size.width / 1.16,
              height: size.height / 4.2,
              child: CachedNetworkImage(
                imageUrl: homeScreenController.poster.value.image!,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16),
                      ),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)),
                ),
                placeholder: ((context, url) => const loading()),
                errorWidget: (context, url, error) => const Icon(
                  Icons.image_not_supported_outlined,
                  size: 50,
                  color: Color.fromARGB(255, 227, 10, 10),
                ),
              ),
              foregroundDecoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  gradient: LinearGradient(
                    colors: GradientColors.homePosterCoverGradiant,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(
                    homeScreenController.poster.value.title!,
                    style: textTheme.headline1,
                  ),
                ],
              ),
            )
          ],
        )));
  }

  Widget tags() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tagList.length,
          itemBuilder: ((context, index) {
            return MainTags(
              textTheme: textTheme,
              index: index,
            );
          })),
    );
  }
}

class SeeMorePodcast extends StatelessWidget {
  const SeeMorePodcast({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(
                0,
                0,
                32,
                0,
              ),
              child: ImageIcon(AssetImage(Assets.icons.microphone.path))),
          //ImageIcon(
          //   Assets.icons.microphone.path,
          //   color: SolidColors.seeMore,
          // ),

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: Text(
              MyStrings.viewHotestPadCasts,
              style: textTheme.headline3,
            ),
          )
        ],
      ),
    );
  }
}


class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
    required this.title,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;
   final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Row(
        children: [
          ImageIcon(AssetImage(Assets.icons.bluePen.path),
              color: SolidColors.seeMore),
          const SizedBox(
            width: 8,
          ),
          Text(
             title,
            style: textTheme.headline3,
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class MainTags extends StatelessWidget {
  MainTags({
    Key? key,
    required this.textTheme,
    required this.index,
  }) : super(key: key);

  final TextTheme textTheme;
  // ignore: prefer_typing_uninitialized_variables
  var index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            gradient: LinearGradient(
              colors: GradientColors.tags,
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
          child: Row(
            children: [
              ImageIcon(
                AssetImage(Assets.icons.hashtag.path),
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                Get.find<HomeScreenController>().tagsList[index].title!,
                style: textTheme.headline2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}





