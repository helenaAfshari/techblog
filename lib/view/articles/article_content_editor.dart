import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:tecblog/component/mycomponent.dart';
import 'package:tecblog/controller/article/manage_article.dart';

class ArticleContentEditor extends StatelessWidget{

   final HtmlEditorController controller = HtmlEditorController();
   var manageArticleController = Get.put(ManageArticleController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () => controller.clearFocus(),
      child: Scaffold(
        appBar:appBar(" نوشتن/ ویرایش مقاله"),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HtmlEditor(
                controller: controller,
                htmlEditorOptions: HtmlEditorOptions(
                  hint: "میتونی مقالتو اینجا بنویسی...",
                  shouldEnsureVisible: true,
                  initialText: manageArticleController.articleInfoModel.value.content!,
                  ),
                  callbacks: Callbacks(
                    onChangeContent: (p0) {
                      manageArticleController.articleInfoModel.value.content=p0;
                      log(manageArticleController.articleInfoModel.value.content.toString());
                    },
                  ),

                ),

            ],
          ),
        ),
         ),
    );
  }


}

