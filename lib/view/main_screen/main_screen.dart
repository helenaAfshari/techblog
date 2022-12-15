import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tecblog/component/decorations.dart';
import 'package:tecblog/component/dimense.dart';
import 'package:tecblog/constant/my_colors.dart';
import 'package:tecblog/constant/my_strings.dart';
import 'package:tecblog/component/mycomponent.dart';
import 'package:tecblog/controller/register_controller.dart';
import 'package:tecblog/gen/assets.gen.dart';
import 'package:tecblog/view/main_screen/home_screen.dart';
import 'package:tecblog/view/main_screen/profile_screen.dart';




final GlobalKey<ScaffoldState> _key = GlobalKey();

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  RxInt selectedPageIndex = 0.obs;

  MainScreen({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
   
      
    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
            backgroundColor: const Color.fromARGB(255, 242, 238, 238),
            child: Padding(
              padding: EdgeInsets.only(right: Dimens.bodyMargin, left: Dimens.bodyMargin),
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Image.asset(
                      Assets.images.logo.path,
                      scale: 3,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "پروفایل کاربری",
                      style: textTheme.headline4,
                    ),
                  ),
                  const Divider(
                    color: SolidColors.deviderColor,
                  ),
                  ListTile(
                    title: Text(
                      "درباره تک‌بلاگ",
                      style: textTheme.headline4,
                    ),
                  ),
                  const Divider(
                    color: SolidColors.deviderColor,
                  ),
                  ListTile(
                    title: Text(
                      "اشتراک گذاری تک بلاگ",
                      style: textTheme.headline4,
                    ),
                    //باید حتما از asyncاستفاده کنیم
                    onTap: () async {
                      await Share.share(MyStrings.shareText);
                    },
                  ),
                  const Divider(
                    color: SolidColors.deviderColor,
                  ),
                  ListTile(
                    title: Text(
                      "تک‌بلاگ در گیت هاب",
                      style: textTheme.headline4,
                    ),
                    onTap: () {
                      myLaunchUrl(MyStrings.techBlogGithubUrl);
                    },
                  ),
                ],
              ),
            )),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: SolidColors.scafoldBg,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  _key.currentState!.openDrawer();
                },
                child: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
              Image.asset(
                Assets.images.logo.path,
                height: size.height / 13.6,
              ),
              const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
                child: Obx(
              () => IndexedStack(
                //selectedpage index چون تعریف کردیم زمانی که روی دکمه هرکدوم را انتخاب کنیم لایه مورد نظر باز میشه
                index: selectedPageIndex.value,
                children: [
                  HomeScreen(
                      size: size, textTheme: textTheme, bodyMargin: Dimens.bodyMargin),
                  const ProfileScreen(),
                ],
              ),
            )),
            BottomNavigation(
              size: size,
              bodyMargin: Dimens.bodyMargin,
              //valueاسم دلبخواهی است
              changeScreen: (int value) {
                selectedPageIndex.value = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
   BottomNavigation({
    //داخل کانستراکتور تعریف کردیم که بتوانیم از بیرون پاس بدهیم بهش
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.changeScreen,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;

  //نوعی متد تعریف کردن است
  final Function(int) changeScreen;
 

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      right: 0,
      left: 0,
      child: Container(
        height: size.height / 10,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: GradientColors.bottomNavBackground,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Container(
            height: size.height / 8,
            decoration:MyDecorations.mainGradient,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => changeScreen(0),
                  icon: ImageIcon(
                    AssetImage(Assets.icons.home.path),
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    //TODO check Login sTatus
                     Get.find<RegisterController>().routTowriteBottomSheet();   
                     
                  },
                  icon: ImageIcon(
                    AssetImage(Assets.icons.writer.path),
                    color: Colors.white,
                    
                  ),
                ),
                IconButton(
                    onPressed: () => changeScreen(1),
                    icon: ImageIcon(
                      AssetImage(Assets.icons.user.path),
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
