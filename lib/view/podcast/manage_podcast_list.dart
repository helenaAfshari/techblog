
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tecblog/component/dimense.dart';
import 'package:tecblog/component/mycomponent.dart';
import 'package:tecblog/constant/my_strings.dart';
import 'package:tecblog/controller/home_screen_controller.dart';
import 'package:tecblog/controller/podcast/single_podcast_controller.dart';
import 'package:tecblog/gen/assets.gen.dart';

import '../../component/text_styl.dart';
import '../../controller/podcast/manage_podcast_controller.dart';
import '../../route_manager/names.dart';

class ManagePodcastList extends StatelessWidget {
   ManagePodcastList({Key? key}) : super(key: key);
   
  ManagePodcastController managePodcastController = Get.put(ManagePodcastController());
   HomeScreenController homeScreenController = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
        var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: 
      Scaffold(
        appBar: appBar("مدیریت پادکست ها"),
        body: Obx(
          () =>managePodcastController.loading.value?loading(): managePodcastController.podcastModel.isNotEmpty
              ? Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 15, 0),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: managePodcastController.podcastModel.length,
            itemBuilder: ((context, index) {
              // return Text(homeScreenController.topPodcast[index].title!,);
              return GestureDetector(
                onTap: () {
                  Get.toNamed(NamedRoute.singlePodcast,arguments: managePodcastController.podcastModel[index]);
                },
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
                              imageUrl: managePodcastController
                                  .podcastModel[index].poster!,
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
                                managePodcastController.podcastModel[index].title!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                managePodcastController
                                    .podcastModel[index].publisher!,
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
        )
              :  podcastEmpty(textTheme),
        ),
         bottomNavigationBar:  Padding(
           padding: const EdgeInsets.all(8.0),
           child: ElevatedButton(
            style:ButtonStyle(fixedSize:MaterialStateProperty.all(Size(Get.width/3, 56))) ,
            onPressed: () {
                 Get.toNamed(NamedRoute.singleManagePodcast );
              }, child: Text("اضافه کردن یک پادکست جدید")),
         ),
        // bottomNavigationBar:  ListView.builder(
        //   itemCount: homeScreenController.topPodcast.length,
        //   scrollDirection: Axis.horizontal,
        //   itemBuilder: ((context, index) {
        //     return GestureDetector(
        //       onTap: () {
        //         Get.toNamed(NamedRoute.singlePodcast,arguments: homeScreenController.topPodcast[index]);
        //       },
          
        //     );
        //   })),
        ),
        );
  }

  Widget podcastEmpty(TextTheme textTheme) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
            Assets.images.sad.path,
            height: 100,
          ),
           Padding(padding: EdgeInsets.only(top: 16),
           child: RichText(
            textAlign: TextAlign.center,
            text:TextSpan(
              text: MyStrings.podcastEmpty,
              style: textTheme.headline4,
            ) ) ,),
          
          ],
          
        ),
      );
  }
}