import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tecblog/constant/my_colors.dart';
import 'package:tecblog/constant/my_strings.dart';
import 'package:tecblog/component/mycomponent.dart';
import 'package:tecblog/gen/assets.gen.dart';
import 'package:tecblog/models/fake_data.dart';

// ignore: use_key_in_widget_constructors
class MyCats extends StatefulWidget {
  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    //اینجا withپروژه را محاسبه میکنیم
    double bodyMargin = size.width / 10;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 32,
                ),
                SvgPicture.asset(
                  Assets.images.bot.path,
                  height: 100,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  MyStrings.sucessfulRegisteration,
                  style: textTheme.headline4,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintText: "نام و نام خانوادگی",
                      hintStyle: textTheme.headline4),
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  MyStrings.choceCat,
                  style: textTheme.headline4,
                ),

                //tagList

                //برای این که لیست را نمایش بده بتونیم مشاهده کنیم
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: SizedBox(
                    width: double.infinity,
                    height: size.height / 9,
                    child: GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: tagList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                //2تا ردیف هست
                                crossAxisCount: 2,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                //این برای این که نمایش بده لیستمون را
                                childAspectRatio: 0.2),
                        itemBuilder: (context, index) {
                          return
                              //اینجا میخواییم لیست را وقتی که روی یکی از دکمه ها زدیم بیاد پایین نمایش بده بنا براین از setstateاستفاده میکنیم
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      if(!selectedTags.contains(tagList[index]))
                                      {
                                        selectedTags.add(tagList[index]);
                                      }else{
                                        debugPrint("${tagList[index]}exist");
                                      }
                                      

                                      // زمانی که روی دکمه کلیک کردم از لیست روی هرکدوم اون چیزی که روش انتخاب شده به selectedtagsاضافه بشه
                                      //selectedTags.add(tagList[index]);
                                    });
                                  },
                                  child: MainTags(
                                      textTheme: textTheme, index: index));
                        }),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: SizedBox(
                    height: 16,
                  ),
                ),
                Image.asset(
                  Assets.icons.flashh.path,
                  //scaleاندازه فلش هست
                ),

                //selectedtags
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: SizedBox(
                    width: double.infinity,
                    height: size.height / 9,
                    child: GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: selectedTags.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          //2تا ردیف هست
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          //این برای این که نمایش بده لیستمون را
                          childAspectRatio: 0.2,
                        ),
                        itemBuilder: (context, index) {
                          //برای این که قسمت پایین نمایش داده شود  وقتی که انتخاب میکنیم از لیست
                          return Container(
                            height: 60,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                    color: SolidColors.surface,
                                
                                ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 8, 8, 8), 
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  
                                  const SizedBox(
                                    width: 8,
                                  ),
                                 Text(
                                  selectedTags[index].title,
                                  style: textTheme.headline4,
                                ),
                                  InkWell(
                                   
                                   onTap: (() {
                                     setState(() {
                                       selectedTags.removeAt(index);
                                     });
                                   }),
                                   child: const Icon(CupertinoIcons.delete,color: Colors.grey,size: 20,)),
                                ],
                              ),
                            ),
                          );
                        }),
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
