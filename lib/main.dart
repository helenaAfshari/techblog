import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tecblog/binding.dart';
import 'package:tecblog/constant/my_colors.dart';
import 'package:tecblog/view/Splash_screen.dart';
import 'package:tecblog/view/articles/manage_article.dart';
import 'package:tecblog/view/articles/single_manage_article.dart';
import 'package:tecblog/view/main_screen/main_screen.dart';
import 'package:tecblog/view/my_http_overrides.dart';
import 'package:tecblog/view/articles/single.dart';
import 'package:tecblog/view/podcast/single_podcast.dart';

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  //این قسمت برای این که رنگ نوبار و ایکون های گوشی مثل وای فای اینارو چگونه نشان بده خودمون دستی دادیم
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: SolidColors.statuseBarColor,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: SolidColors.systemNavigationBarColor,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
 await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      initialBinding: RegisterBinding(),
        locale: const Locale('fa'),
        theme: lightTheme(),
        debugShowCheckedModeBanner: false,
        getPages: [
           GetPage(name: NamedRoute.routeMainScreen, page: () => MainScreen(),binding: RegisterBinding()),
            GetPage(name: NamedRoute.routeSingleArticle, page: () => Single(),binding: ArticleBinding()),
           
            GetPage(
              name: NamedRoute.routemanageArticle,
             page: (() => ManageArticleScreen()),
             binding: ArticleManagerBinding()),

              GetPage(
              name: NamedRoute.singleManageArticle,
             page: (() => SingleManageArticle()),
             binding: ArticleManagerBinding()),  
             GetPage(
              name: NamedRoute.singleManageArticle,
             page: (() => SingleManageArticle()),
            ),
            GetPage(
              name: NamedRoute.singlePodcast, 
              page:( () => PodcastSingle()),
            ),
      ],
      home: SplashScreen(),
        // home:  Single(),
       // home: SinglePodcast(),
        );
  }

  ThemeData lightTheme() {
    return ThemeData(
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(width: 2),
            ),
            filled: true,
            fillColor: const Color.fromARGB(255, 80, 74, 86)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return const TextStyle(fontSize: 25);
              }
              return const TextStyle(fontSize: 20);
            }),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return SolidColors.prymaryColor;
              }
              return SolidColors.prymaryColor;
              
            }),
          ),
        ),
        fontFamily: 'dubai',
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontFamily: 'dubai',
              color: SolidColors.posterTitle,
              fontWeight: FontWeight.w700,
              fontSize: 16),
          subtitle1: TextStyle(
              fontFamily: 'dubai',
              color: SolidColors.posterSubTitle,
              fontWeight: FontWeight.w700,
              fontSize: 14),
          bodyText1: TextStyle(
              fontFamily: 'dubai',
              color: Colors.black12,
              fontWeight: FontWeight.w300,
              fontSize: 10),
          headline2: TextStyle(
              fontFamily: 'dubai',
              color: Color.fromARGB(255, 232, 227, 227),
              fontWeight: FontWeight.w700,
              fontSize: 11),
          headline3: TextStyle(
              fontFamily: 'dubai',
              color: SolidColors.seeMore,
              fontWeight: FontWeight.w700,
              fontSize: 14),
          headline4: TextStyle(
              fontFamily: 'dubai',
              color: Color.fromARGB(255, 41, 12, 16),
              fontWeight: FontWeight.w700,
              fontSize: 11),
          headline5: TextStyle(
              fontFamily: 'dubai',
              color: SolidColors.hintText,
              fontWeight: FontWeight.w700,
              fontSize: 14),
        ),
      );
  }
}

class NamedRoute{
 
 //اینجا به صورت staticکار میکند 
 //اگر از این کانستراکتور استفاده کنیم
 NamedRoute._();

static String routeMainScreen = "/MainScreen";
static String routeSingleArticle = "/SingleArticle";
static String routemanageArticle = "/ManageArticle";
static String singleManageArticle = "/SingleManageArticle";
static String singlePodcast = "/singlePodcast";
}

