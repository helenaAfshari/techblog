



import 'package:flutter/material.dart';

import 'package:tecblog/my_colors.dart';
import 'package:tecblog/my_strings.dart';
import '../gen/assets.gen.dart';
import '../myComponent.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           
           Image(image: Assets.images.avatar,height: 100,),
           const SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(Assets.icons.bluePen,color: SolidColors.seeMore,),
                const SizedBox(width: 8,),
                Text(
                   MyStrings.imageProfileEdit,
                   style: textTheme.headline3,
                ),
              ],
            ),
            const SizedBox(height: 60,),
            Text("فاطمه",style: textTheme.headline4,),
            Text("fatemeamiri@gmail.com",style: textTheme.headline4,),
            const SizedBox(height: 40,),
            TechDivider(size: size),
            InkWell(
              onTap: () {
                
              },
              splashColor: SolidColors.prymaryColor,
              child: SizedBox(
                height: 45,
                
                child: Center(child: Text(MyStrings.myFavoriteBlog,style: textTheme.headline4,))),
              

            ),
            TechDivider(size: size),
            InkWell(
              onTap: () {
                
              },
              splashColor: SolidColors.prymaryColor,
              child: SizedBox(
                height: 45,
                
                child: Center(child: Text(MyStrings.myFavoritePodcast,style: textTheme.headline4,))),
              

            ),
            TechDivider(size: size),
            InkWell(
              onTap: () {
                
              },
              splashColor: SolidColors.prymaryColor,
              child: SizedBox(
                height: 45,
                
                child: Center(child: Text(MyStrings.logout,style: textTheme.headline4,))),
              

            ),
            const SizedBox(height: 60,),

        ],
      ),
    )
        );
  }
}



