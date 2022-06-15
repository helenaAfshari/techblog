
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tecblog/view/main_screen.dart';
import 'package:tecblog/view/register_intro.dart';
import 'package:tecblog/my_colors.dart';




void main() {

     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
         statusBarColor: SolidColors.statuseBarColor,
         statusBarIconBrightness: Brightness.dark,
         systemNavigationBarColor: SolidColors.systemNavigationBarColor,
         systemNavigationBarIconBrightness: Brightness.dark,
         
       ));

  runApp(const MyApp());
}
       
      
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  localizationsDelegates: const [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: const [
    Locale('fa', ''), // farsi
  ],
  theme: ThemeData(
    inputDecorationTheme: InputDecorationTheme(border: OutlineInputBorder(borderRadius: BorderRadius.circular(16),
       borderSide: const BorderSide(width: 2),

     ),
     filled: true,
     fillColor: Color.fromARGB(255, 80, 74, 86)
     ) ,
         elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(
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
                    return SolidColors.prymaryColor;;
                  }),
                ),) ,

    fontFamily: 'dubai',
    textTheme: const TextTheme(
      headline1:  
         TextStyle(fontFamily: 'dubai',color: SolidColors.posterTitle,fontWeight:FontWeight.w700,fontSize: 16),
      subtitle1:  
               TextStyle(fontFamily: 'dubai',color: SolidColors.posterSubTitle,fontWeight:FontWeight.w700,fontSize: 14) ,
      bodyText1:  
             TextStyle(fontFamily: 'dubai',color: Colors.black12,fontWeight: FontWeight.w300,fontSize: 10),
      headline2: 
             TextStyle(fontFamily: 'dubai',color: Color.fromARGB(255, 232, 227, 227),fontWeight:FontWeight.w700,fontSize: 14),
      headline3:  
            TextStyle(fontFamily: 'dubai',color: SolidColors.seeMore,fontWeight:FontWeight.w700,fontSize: 14),
      headline4: 
          TextStyle(fontFamily: 'dubai',color: Color.fromARGB(255, 41, 12, 16),fontWeight:FontWeight.w700,fontSize: 14),
       headline5: 
          TextStyle(fontFamily: 'dubai',color: SolidColors.hintText,fontWeight:FontWeight.w700,fontSize: 14),
      
    ),
    
  ),
  debugShowCheckedModeBanner: false,
    home: const RegisterIntro());
  }
}
