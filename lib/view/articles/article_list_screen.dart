

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tecblog/binding.dart';
import 'package:tecblog/component/mycomponent.dart';
import 'package:tecblog/controller/article/list_article_controller.dart';
import 'package:tecblog/controller/article/single_article_controller.dart';
import 'package:tecblog/main.dart';
import 'package:tecblog/view/articles/single.dart';


// ignore: must_be_immutable
class ArticleListScreen extends StatefulWidget {
  String title;
  ArticleListScreen({required this.title, Key? key}) : super(key: key);

  @override
  State<ArticleListScreen> createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {
  ListArticleController listarticleController =
      Get.put(ListArticleController());

  SingleArticleController singleArcticleController =
      Get.put(SingleArticleController());

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: appBar(widget.title),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: Obx(
              () => !singleArcticleController.loading.value
                  ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: listarticleController.articleList.length,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: (()async {
                           await singleArcticleController.getArticleInfo(
                                listarticleController.articleList[index].id);
                                Get.toNamed(NamedRoute.routeSingleArticle);
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
                                    imageUrl: listarticleController
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
                                      return const loading();
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
                                        listarticleController
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
                                          listarticleController
                                              .articleList[index].author!,
                                          style: textTheme.caption,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          listarticleController
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
                  : const loading(),
            ),
          ),
        ),
      ),
    );
  }
}
