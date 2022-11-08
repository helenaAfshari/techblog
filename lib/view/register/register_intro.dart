import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tecblog/constant/my_strings.dart';
import 'package:tecblog/controller/register_controller.dart';
import 'package:tecblog/gen/assets.gen.dart';
import 'package:tecblog/view/main_screen/main_screen.dart';


import 'package:validators/validators.dart';

// ignore: must_be_immutable
class RegisterIntro extends StatelessWidget {
   RegisterIntro({Key? key}) : super(key: key);
    var registerController = Get.find<RegisterController>();
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.images.bot.path,
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: MyStrings.welcom, style: textTheme.headline4)),
              ),
              ElevatedButton(
                onPressed: (() {
                  _showEmailBottomSheet(context, size, textTheme);
                }),
                child: const Text(
                  "بزن بریم",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showEmailBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Padding(
            //این برای این که زمانی که نوشترو میاریم بره بالا صفحه کیبورد تایپ
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 2,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      MyStrings.insertYoureEmail,
                      style: textTheme.headline4,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: TextField(
                        //هرچی که در این تغییر کرد ما مشاهده کنیم
                        onChanged: (value) {
                            print(value + " is Email : " + isEmail(value).toString());
                        },
                        controller: registerController.emailTextEditingController,
                        style: textTheme.headline5,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "afshari.hln@gmail.com",
                          hintStyle: textTheme.headline5,
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: (() async{

                        registerController.register();
                          Navigator.pop(context);
                          _activateCodeBottomSheet(context, size, textTheme);
                            
                                
                           
                        }),
                        child: const Text("ادامه"))
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<dynamic> _activateCodeBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Padding(
            //این برای این که زمانی که نوشترو میاریم بره بالا صفحه کیبورد تایپ
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 2,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      MyStrings.activate,
                      style: textTheme.headline4,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: TextField(
                         controller: registerController.activeCodeTextEditingController ,
                        //هرچی که در این تغییر کرد ما مشاهده کنیم
                        onChanged: (value) {
                          print(value + "isEmail :" + 
                          isEmail(value).toString());
                          
                        },
                       
                        style: textTheme.headline5,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "******",
                          hintStyle: textTheme.headline5,
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: (() {
                        registerController.verify();
                      
                      
                          // Navigator.of(context).pushReplacement(
                          //     MaterialPageRoute(
                          //         builder: (context) => MyCats()));
                        }),
                        child: const Text("کد فعال سازی رو وارد کن "))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
