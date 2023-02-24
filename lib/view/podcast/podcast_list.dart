import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tecblog/constant/my_colors.dart';
import 'package:tecblog/controller/home_screen_controller.dart';
import 'package:tecblog/gen/fonts.gen.dart';
import 'package:tecblog/route_manager/binding.dart';
import 'package:tecblog/component/mycomponent.dart';
import 'package:tecblog/controller/article/list_article_controller.dart';
import 'package:tecblog/controller/article/single_article_controller.dart';
import 'package:tecblog/main.dart';
import 'package:tecblog/route_manager/names.dart';
import 'package:tecblog/view/articles/single.dart';

import '../../component/dimense.dart';
import '../../component/text_styl.dart';
import '../../controller/podcast/single_podcast_controller.dart';
import '../../gen/assets.gen.dart';
import '../../models/podcast_model.dart';

// ignore: must_be_immutable
class HotPodcastList extends StatelessWidget {
  final String title;

  late SinglePodcastController controller;
  PodcastModel? podcastModel;
  SinglePodcastController singlePodcastController =
      Get.put(SinglePodcastController());
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  HotPodcastList({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: appBar(title),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 15, 0),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: homeScreenController.topPodcast.length,
            itemBuilder: ((context, index) {
              // return Text(homeScreenController.topPodcast[index].title!,);
              return GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CachedNetworkImage(
                              imageUrl: homeScreenController
                                  .topPodcast[index].poster!,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(16),
                                    ),
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover)),
                              ),
                              placeholder: ((context, url) => const loading()),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.image_not_supported_outlined,
                                size: 50,
                                color: Color.fromARGB(255, 227, 10, 10),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              0, 0, 0, Dimens.bodyMargin / 1),
                          child: Column(
                            children: [
                              Text(
                                homeScreenController.topPodcast[index].title!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                homeScreenController
                                    .topPodcast[index].publisher!,
                                style: subTextPodcastList,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
