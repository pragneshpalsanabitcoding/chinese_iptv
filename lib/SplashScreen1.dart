import 'dart:io';

import 'package:chinese_iptv/GetStartScreen.dart';
import 'package:chinese_iptv/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkData();
  }

  checkData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var value = pref.getBool("aggrement");
    if (value == true) {
      Future.delayed(const Duration(seconds: 2), () {
        Get.off(const GetStartScreen());
      });
    } else {
      showDialogPop();
    }
  }

  showDialogPop() async {
    await Future.delayed(const Duration(seconds: 1));
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (aa) {
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: AlertDialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              actions: [
                Container(
                  alignment: Alignment.center,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: themeButtonColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  height: 8.h,
                  child: Text(
                    "Agreement",
                    style: TextStyle(color: Colors.white, fontSize: 6.w),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Padding(
                          padding: EdgeInsets.all(1.h),
                          child: const Text(
                            "Before you download please read carefully we are not providing TV Channel and it’s not TV channel app and this app gives you channel URL or File and QR code also",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey),
                          )),
                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(
                        onTap: () async {
                          Get.back();

                          SharedPreferences pref =
                          await SharedPreferences.getInstance();

                          pref.setBool("aggrement", true);

                          Future.delayed(const Duration(seconds: 2), () {
                            Get.off(const GetStartScreen());
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 30.w,
                          padding: EdgeInsets.all(2.h),
                          decoration: BoxDecoration(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(14)),
                              color: themeButtonColor),
                          child: Text(
                            "Accept",
                            style:
                            TextStyle(color: Colors.white, fontSize: 4.w),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(
                        onTap: () {
                          exit(0);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 30.w,
                          padding: EdgeInsets.all(2.h),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(14))),
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.red, fontSize: 4.w),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Image.asset(
                commonImage,
                fit: BoxFit.fill,
              )),
        );
      },
    );
  }
}
