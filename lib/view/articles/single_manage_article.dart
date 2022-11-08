

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tecblog/Services/pick_file.dart';
import 'package:tecblog/component/dimense.dart';
import 'package:tecblog/constant/my_colors.dart';
import 'package:tecblog/component/mycomponent.dart';
import 'package:tecblog/controller/article/list_article_controller.dart';
import 'package:tecblog/controller/article/manage_article.dart';
import 'package:tecblog/controller/article/single_article_controller.dart';
import 'package:tecblog/controller/file_controller.dart';
import 'package:tecblog/gen/assets.gen.dart';
import 'package:tecblog/view/articles/article_list_screen.dart';



// ignore: must_be_immutable
class SingleManageArticle extends StatelessWidget {

  var manageArticleController =
      Get.find<ManageArticleController>();

      FilePickerController filePickerController = Get.put(FilePickerController());

  SingleManageArticle({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var textheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics:const BouncingScrollPhysics(),
        child: Obx(
          () =>  Column(
                children: [
                  Stack(
                    children: [
                          filePickerController.file.value.name=='nothing'?

    
                      CachedNetworkImage(
                        imageUrl: manageArticleController
                            .articleInfoModel.value.image!,
                        imageBuilder: ((context, imageProvider) =>
                            Image(image: imageProvider)),
                        placeholder: ((context, url) => const loading()),
                        errorWidget: ((context, url, error) =>
                            Image.asset(Assets.images.singlePlaceHolder.path)),
                      ):
                       Image.file(File(filePickerController.file.value.path!)),
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
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                               
                               
                              ],
                            ),
                          ))
                       ,Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child:
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              //pickFile
                              pickFile();
                            },
                            child: Container(
                                                   
                            height: 30,
                            width: Get.width/3,
                            decoration: const BoxDecoration(
                              color: SolidColors.prymaryColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                               Text("انتخاب تصویر",style: textheme.headline2,),
                               const Icon(Icons.add,color: Colors.white,)
                              ],
                            ),
                                                 ),
                          ),
                        ))

                    ],
                  ),
                  const SizedBox(height: 24,),

                  SeeMoreBlog(
               bodyMargin: Dimens.bodyMargin, textTheme: textheme, title: ' ویرایش عنوان مقاله',),
                  Padding(
                    padding:  EdgeInsets.all(Dimens.halfbodyMargin),
                    
                    child: Text(
                      manageArticleController.articleInfoModel.value.title!,
                      maxLines: 2,
                      style: textheme.titleLarge,
                    ),
                  ),
               
                    SeeMoreBlog(
               bodyMargin: Dimens.bodyMargin, textTheme: textheme, title: ' ویرایش متن اصلی مقاله',),
                 
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: HtmlWidget(
                      manageArticleController.articleInfoModel.value.content!,
                      textStyle: textheme.headline5,
                      enableCaching: true,
                      onLoadingBuilder: ((context, element, loadingProgress) =>
                          const loading()),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SeeMoreBlog(
               bodyMargin: Dimens.bodyMargin, textTheme: textheme, title: 'انتخاب دسته بندی',),
                  tags(textheme),
                  
                 
                  ]
                  ),
                ),
        ),
      ),
    );
  }

  Widget tags(textheme) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: manageArticleController.tagList.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () async {
                var tagId = manageArticleController.tagList[index].id!;

                await Get.find<ListArticleController>()
                    .getArticleListWithTagsId(tagId);

                String tagName = manageArticleController.tagList[index].title!;
                Get.to(ArticleListScreen(
                  title: tagName,
                ));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Container(
                  height: 30,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      color: Colors.grey),
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: Text(
                        manageArticleController.tagList[index].title!,
                        style: textheme.headline2,
                      )),
                ),
              ),
            );
          })),
    );
  }

}