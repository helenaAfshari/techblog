
//فایل هایی که در پروژه خیلی استفاده میشه را در این کلاس مینویسیم
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tecblog/constant/my_strings.dart';
import 'package:tecblog/component/text_styl.dart';
import 'package:tecblog/controller/home_screen_controller.dart';
import 'package:tecblog/gen/assets.gen.dart';
import 'package:tecblog/models/fake_data.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant/my_colors.dart';

class TechDivider extends StatelessWidget { 
  const TechDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 2,
      color: SolidColors.deviderColor,
      indent: size.width/6,
      endIndent: size.width/6 ,
    );
  }
}
//اینجا برای مدل لیستمون هست که حالت بیضی هست
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
    return Container(
      height: 60,
      decoration: const BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(40)),
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
              Assets.icons.hashtag as ImageProvider,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(
              width: 5,
            ),
            
               Text(
                 Get.find<HomeScreenController>().tagsList[index].title!,
                style: textTheme.headline2,
                
            
            )
          ],
        ),
      ),
    );
  }
}


// ignore: must_be_immutable
class HashTag extends StatelessWidget {

   HashTag({
    Key? key,
    required this.textTheme,
    required this.index,
  }) : super(key: key);

  final TextTheme textTheme;
   // ignore: prefer_typing_uninitialized_variables
   var index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(40)),
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
              Assets.icons.hashtag as ImageProvider,
              color: Colors.white,
              size: 16,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              tagList[index].title,
              style: textTheme.headline2,
            ),
          ],
        ),
      ),
    );
  }
}


myLaunchUrl(String url) async {
   var uri = Uri.parse(url);
  if (await canLaunchUrl(uri)){

    await launchUrl(uri);

  }else{
    log("couldnot launch ${uri.toString()} ");
  }
}

// ignore: camel_case_types
class loading extends StatelessWidget {

  const loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SpinKitFadingCube(
          color: SolidColors.prymaryColor,
          size: 32.0,
        );
  }
}



 PreferredSize appBar(String title ) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
            actions: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Center(child: Text(title,style: appBarTextStyle,)),
                ),
            ],
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Container(
                   height: 40,
                   width: 40,
                   decoration: BoxDecoration(
                    color: SolidColors.prymaryColor.withBlue(100),
                    shape: BoxShape.circle,
                    
                   ),
                   child: const Icon(Icons.keyboard_arrow_right_rounded),
                ),
              ),
            ) ,
        ),
      ),
    );
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