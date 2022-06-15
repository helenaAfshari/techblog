 import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tecblog/gen/assets.gen.dart';
import 'package:tecblog/models/fake_data.dart';
import 'package:tecblog/my_strings.dart';
import 'package:tecblog/mycomponent.dart';

class MyCats extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme =  Theme.of(context).textTheme;
    double bodyMargin = size.width/10;
    return SafeArea(child:
     Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding:  EdgeInsets.only(right: bodyMargin,left: bodyMargin),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 SizedBox(height: 32,),
                SvgPicture.asset(Assets.images.bot.path,height: 100,),
                const SizedBox(height: 16,),
                Text(MyStrings.sucessfulRegisteration,style: textTheme.headline4,),
                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(alignLabelWithHint: true,
                  hintText: "نام و نام خانوادگی",
                  hintStyle: textTheme.headline4),
                ),
                const SizedBox(height: 32,),
                 Text(MyStrings.choceCat,style: textTheme.headline4,),
                   
                   //tagList

                   //برای این که لیست را نمایش بده بتونیم مشاهده کنیم
               SizedBox(
                 width: double.infinity,
                 height: 85,
                 child: GridView.builder(
                   physics: const ClampingScrollPhysics(),
                   itemCount: tagList.length,
                     shrinkWrap: true,
                     scrollDirection: Axis.horizontal,
                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 2,
                     crossAxisSpacing: 5,
                     mainAxisSpacing: 5,
                     childAspectRatio: 0.3
                    
                     
                     ) ,
                     itemBuilder: (context,index){
                       return MainTags(textTheme: textTheme, index: index);
                     }
                     ),
               ),
                
              ],
            ),
          ),
        ),
      ),
    ));
  }

}