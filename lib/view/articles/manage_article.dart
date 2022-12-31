import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tecblog/constant/my_strings.dart';
import 'package:tecblog/component/mycomponent.dart';

import 'package:tecblog/gen/assets.gen.dart';
import 'package:tecblog/main.dart';

import '../../controller/article/manage_article_controller.dart';



// ignore: must_be_immutable
class ManageArticleScreen extends StatelessWidget {
   ManageArticleScreen({Key? key}) : super(key: key);
     var articleManageController = Get.find<ManageArticleController>();
    // ManageArticleController  = Get.put(ManageArticleController());
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: appBar('مدیریت مقاله ها'),
        body:  Obx(
              () => articleManageController.loading.value?loading(): articleManageController.articleList.isNotEmpty
                  ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: articleManageController.articleList.length,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: (()async {
                           //route to singleManege
                          }),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: Get.height / 6,
                                  width: Get.width / 3,
                                  child: CachedNetworkImage(
                                    imageUrl: articleManageController
                                        .articleList[index].image!,
                                    imageBuilder: (((context, imageProvider) {
                                      return Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(16)),
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover)),
                                      );
                                    })),
                                    placeholder: ((context, url) {
                                      return  const loading();
                                    }),
                                    errorWidget: ((context, url, error) {
                                      return const Icon(
                                          Icons.image_not_supported_outlined,
                                          size: 50,
                                          color: Colors.grey);
                                    }),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: Get.width / 2,
                                      child: Text(
                                        articleManageController
                                            .articleList[index].title!,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          articleManageController
                                              .articleList[index].author!,
                                          style: textTheme.caption,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          articleManageController
                                                  .articleList[index].view! +
                                              " بازدید ",
                                          style: textTheme.caption,
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    )
                  : articleEmptyState(textTheme),
            ),
      
       bottomNavigationBar: Padding(
         padding: const EdgeInsets.all(8.0),
         child: ElevatedButton(
          style:  ButtonStyle(fixedSize: MaterialStateProperty.all(Size(Get.width/3,56))),
                onPressed: (() {
                  Get.toNamed(NamedRoute.singleManageArticle);
                }),
                child: const Text(
                  "بریم برای نوشتن یه مقاله باحال",
                ),
              ),
       ),
      ),
    );
  }

  Widget articleEmptyState(TextTheme textTheme) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.images.sad.path,
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: MyStrings.articleEmpty, style: textTheme.headline4)),
            ),
          
          ],
        ),
      );
  }
}
