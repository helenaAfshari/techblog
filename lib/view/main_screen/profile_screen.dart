

import 'package:flutter/material.dart';
import 'package:tecblog/constant/my_colors.dart';
import 'package:tecblog/constant/my_strings.dart';
import 'package:tecblog/component/mycomponent.dart';
import 'package:tecblog/gen/assets.gen.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
   
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size =  MediaQuery.of(context).size;
    var textTheme= Theme.of(context).textTheme;

    return MaterialApp(
      home: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             
             Image.asset(Assets.images.avatar.path ,height: 100,),
             const SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(AssetImage(Assets.icons.bluePen.path),color:SolidColors.seeMore),
                //Ejra Begir bbin miad???
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
          ),
    );
  }
}



