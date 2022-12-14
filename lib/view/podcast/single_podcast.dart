import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tecblog/component/decorations.dart';
import 'package:tecblog/component/dimense.dart';
import 'package:tecblog/component/mycomponent.dart';
import 'package:tecblog/constant/my_colors.dart';
import 'package:tecblog/gen/assets.gen.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SinglePodcast extends StatelessWidget {
  const SinglePodcast
  ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
       var textheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body:
         Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child:  SingleChildScrollView(
           child: Column(
                      children: [
                        Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: "https://s6.uupload.ir/files/wallpapergram.ir_1557321899_66413_0s86.jpg",
                                  
                              imageBuilder: ((context, imageProvider) =>
                                  Image(image: imageProvider)),
                              placeholder: ((context, url) => const loading()),
                              errorWidget: ((context, url, error) =>
                                  Image.asset(Assets.images.singlePlaceHolder.path)),
                            ),
                            Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 60,
                                  decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                          end: Alignment.bottomCenter,
                                          begin: Alignment.topCenter,
                                          colors:
                                              GradientColors.singleAppbarGradiant)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children:  [
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      GestureDetector(
                                        onTap: () => Get.back(),
                                        child:const  Icon(
                                          Icons.arrow_back,
                                          color: Colors.white,
                                          size: 24,
                                          
                                        ),
                                      ),
                                    const  Expanded(child: SizedBox()),
                                    
                                     const SizedBox(
                                        width: 20,
                                      ),
                                     const Icon(
                                        Icons.share,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                     const SizedBox(
                                        width: 20,
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              " عنوان پادکست",
                              maxLines: 2,
                              style: textheme.titleLarge,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image(
                                image: Image.asset(Assets.images.avatar.path).image,
                                height: 50,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                               "هانا",
                                style: textheme.headline4,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                            
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                            
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                     Row(
                                      children: [
                                        ImageIcon(
                                          Image.asset(Assets.icons.microphone.path).image,
                                          color: SolidColors.seeMore,
                                          ),
                                          const SizedBox(width: 8,),
                                          Text("بخش چهارم : فریلنسر دیوانه",style: textheme.headline4,),
                                      ],
                                     ),
                                     const Text("22:00")
                                ],
                              ),
                            );
                          },),
                        )
                        ],
                        ),
         ), ),
            
            Positioned(
              bottom: 8,
              right: Dimens.bodyMargin,
              left: Dimens.bodyMargin,
              child: Container(
                height: Get.height/7,
                decoration: MyDecorations.mainGradient,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      LinearPercentIndicator(
                        percent: 1.0,
                        backgroundColor: Colors.white,
                        progressColor: Colors.orange,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:const [
                          Icon(
                            Icons.skip_next,
                            color: Colors.white,
                          ),  Icon(
                            Icons.play_circle_fill,
                            color: Colors.white,
                            size: 48,
                          ),  Icon(
                            Icons.skip_previous,
                            color: Colors.white,
                          ), 
                            SizedBox(),
                           Icon(
                            Icons.repeat,
                            color: Colors.white,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
         )
      ),
    
    );
  }
}