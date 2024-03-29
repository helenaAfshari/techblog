import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tecblog/route_manager/binding.dart';
import 'package:tecblog/constant/my_colors.dart';
import 'package:tecblog/route_manager/names.dart';
import 'package:tecblog/route_manager/pages.dart';
import 'package:tecblog/view/Splash_screen.dart';
import 'package:tecblog/view/articles/manage_article.dart';
import 'package:tecblog/view/articles/single_manage_article.dart';
import 'package:tecblog/view/main_screen/main_screen.dart';
import 'package:tecblog/view/my_http_overrides.dart';
import 'package:tecblog/view/articles/single.dart';
import 'package:tecblog/view/podcast/single_podcast.dart';

import 'view/podcast/s.dart';
import 'view/podcast/single_manage_podcast.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';


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
      getPages: Pages.pages,
       initialRoute: NamedRoute.initialRoute,
      initialBinding: RegisterBinding(),
        locale: const Locale('fa'),
        theme: lightTheme(),
        debugShowCheckedModeBanner: false,
      
         home:  SingleManagePodcast(),
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

// import 'package:flutter/material.dart';

// import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Time Picker Spinner Demo',
//       theme: ThemeData(

//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Time Picker Spinner Demo'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);


//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   DateTime _dateTime = DateTime.now();
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
  //     body: new Container(
  //       padding: EdgeInsets.only(
  //           top: 100
  //       ),
  //       child: new Column(
  //         children: <Widget>[
  //          // hourMinute12H(),
  //          //  hourMinute15Interval(),
  //          hourMinuteSecond(),
  //          //hourMinute12HCustomStyle(),
  //           new Container(
  //             margin: EdgeInsets.symmetric(
  //                 vertical: 20
  //             ),
  //             child: new Text(
  //                   _dateTime.minute.toString().padLeft(1, '0') + ':' +
  //                   _dateTime.second.toString().padLeft(1, '0'),
  //               style: TextStyle(
  //                 fontSize: 24,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     )
  //   );
  // }


//   //SAMPLE
//   Widget hourMinute12H(){
//     return new TimePickerSpinner(
//       is24HourMode: false,

//       onTimeChange: (time) {
//         setState(() {
//           _dateTime = time;
//         });
//       },
//     );
//   }
//   Widget hourMinuteSecond(){
//     return new TimePickerSpinner(
//       isShowSeconds: true,
     
//       onTimeChange: (time) {
//         setState(() {
//           _dateTime = time;
//         });
//       },
//     );
//   }
  
//   // Widget hourMinute15Interval(){
//   //   return new TimePickerSpinner(
      
//   //     minutesInterval: 1,
//   //     onTimeChange: (time) {
//   //       setState(() {
//   //         _dateTime = time;
//   //       });
//   //     },
//   //   );
//   // }
//   Widget hourMinute12HCustomStyle(){
//     return new TimePickerSpinner(
      
//       normalTextStyle: TextStyle(
//         fontSize: 24,
//         color: Colors.deepOrange
//       ),
//       highlightedTextStyle: TextStyle(
//         fontSize: 24,
//         color: Colors.yellow
//       ),
      
//       itemHeight: 80,

//       onTimeChange: (time) {
//         setState(() {
//           _dateTime = time;
//         });
//       },
//     );
//   }
// }

