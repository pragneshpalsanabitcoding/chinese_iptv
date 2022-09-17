import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chinese_iptv/GetController.dart';
import 'package:chinese_iptv/ads/Ads%20File.dart';
import 'package:chinese_iptv/const.dart';
import 'package:chinese_iptv/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

exitDialog(BuildContext context) {
   showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (ctx) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.h),
                  topRight: Radius.circular(5.h))),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            SizedBox(height: 2.5.h),
            Text(
                '${modelApi!.comBitlinksChineseIptvM3ulist!.exitDialog!.exitTitle}',
                style: TextStyle(
                    fontSize: 5.w, fontWeight: FontWeight.bold)),
            SizedBox(height: 1.h),
            Text(
                "${modelApi?.comBitlinksChineseIptvM3ulist!.exitDialog!.exitMessage}"),
            SizedBox(height: 1.h),
            mediumNativeAds(),
            SizedBox(height: 1.5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Get.back();
                      Share.share(
                          "${modelApi!.comBitlinksChineseIptvM3ulist!.shareApp!.shareTitle}");
                    },
                    child: const Icon(Icons.share)),
                InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Get.back();
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) => RatingDialog(
                            image: Image.asset(
                              logo,
                              height: 15.h,
                              width: 15.w,
                            ),
                            initialRating: 5.0,
                            title: Text(
                              '${modelApi!.comBitlinksChineseIptvM3ulist!.aboutApp!.aboutTitle}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // encourage your user to leave a high rating?
                            message: Text(
                              '${modelApi!.comBitlinksChineseIptvM3ulist!.rateApp!.rateMessage}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 15),
                            ),
                            // your app's logo?
                            submitButtonText: 'Submit',
                            onCancelled: () {},
                            onSubmitted: (response) {
                              // TODO: add your own logic
                              if (response.rating <= 2.0) {
                                MotionToast.success(
                                  title: const Text(
                                      "Thanks For Your Rating"),
                                  description: const Text(
                                      "We Will Improve App"),
                                  width: 300,
                                  height: 80,
                                ).show(context);
                              } else {
                                launch(
                                    "${modelApi!.comBitlinksChineseIptvM3ulist!.rateApp!.rateAppUrl}");
                              }
                            },
                            starSize: 30,
                          ));
                    },
                    child: const Icon(Icons.star)),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      exit(0);
                    },
                    child: Container(
                      margin: EdgeInsets.all(1.h),
                      alignment: Alignment.center,
                      width: 40.w,
                      height: 5.h,
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius:
                          BorderRadius.all(Radius.circular(20))),
                      child: const Text(
                        "Yes",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      margin: EdgeInsets.all(1.h),
                      alignment: Alignment.center,
                      width: 40.w,
                      height: 5.h,
                      decoration: const BoxDecoration(
                          color: Color(0xffffe234),
                          borderRadius:
                          BorderRadius.all(Radius.circular(20))),
                      child: const Text(
                        "No",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        );
      });
  return false;
}

Future<void> showAboutUs(BuildContext context) async {
  // String appName = await GetVersion.appName;
  // String projectVersion = await GetVersion.projectVersion;

  return showAboutDialog(
    context: context,
    applicationIcon: SizedBox(
      height: 100.sp,
      width: 100.sp,
      child: Image(
        image: AssetImage(logo),
        fit: BoxFit.contain,
        alignment: Alignment.bottomCenter,
      ),
    ),
    applicationLegalese:
    modelApi!.comBitlinksChineseIptvM3ulist!.aboutApp!.registrationDetail,
    applicationName: apptitle,
    // anchorPoint: ,
    applicationVersion: '${Controller.to.versionCode.value}',
    children: <Widget>[
      Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: Text(
              "${modelApi!.comBitlinksChineseIptvM3ulist!.aboutApp!.aboutMessage}")),
    ],
  );
}

updateDialoug() {
  (modelApi!.comBitlinksChineseIptvM3ulist?.appUpdate!.isPopupDialog == true &&
      (modelApi!.comBitlinksChineseIptvM3ulist?.appUpdate!.updatedVersionCode ?? 1) > Controller.to.versionCode.value) ? Future.delayed(const Duration(seconds: 1), () {
    Get.defaultDialog(
        onWillPop: () async {
          if (modelApi!.comBitlinksChineseIptvM3ulist?.appUpdate!
              .isUpdateRequire ==
              true) {
            return false;
          } else {
            return true;
          }
        },
        content: Image.network(
          '${modelApi!.comBitlinksChineseIptvM3ulist!.appUpdate!.appIcon}',
          height: 15.h, width: 15.h,),
        actions: [
          Center(
            child: Column(
              children: [
                Text(
                    "${modelApi!.comBitlinksChineseIptvM3ulist?.appUpdate!
                        .title}",
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                Text(
                    "\n${modelApi!.comBitlinksChineseIptvM3ulist?.appUpdate!
                        .defaultMessage}",
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 1.h,
                )
              ],
            ),
          )
        ],
        backgroundColor: Colors.white,
        titleStyle: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold),
        middleTextStyle: const TextStyle(
          color: Colors.white,
        ),
        confirm: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: modelApi!.comBitlinksChineseIptvM3ulist?.appUpdate!
                  .isUpdateRequire ==
                  true
                  ? 0.w
                  : 1.w,
            ),
            modelApi!.comBitlinksChineseIptvM3ulist?.appUpdate!
                .isUpdateRequire! !=
                true
                ? InkWell(splashColor: Colors.transparent,highlightColor: Colors.transparent,
              onTap: () {
                Get.back();
              },
              child: Container(margin: EdgeInsets.all(1.h),
                padding: EdgeInsets.all(1.h),
                child: const Text(
                  "No Thanks",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
                : Container(),
            SizedBox(
              width: modelApi!.comBitlinksChineseIptvM3ulist!.appUpdate!
                  .isUpdateRequire ==
                  true
                  ? 0.w
                  : 1.w,
            ),
            InkWell(splashColor: Colors.transparent,highlightColor: Colors.transparent,
              onTap: () {
                // ignore: deprecated_member_use
                launch(
                    "${modelApi!.comBitlinksChineseIptvM3ulist!.appUpdate!
                        .websiteUrl}");
              },
              child: Stack(
                children: [
                  Container(margin: EdgeInsets.all(1.h),
                    padding: EdgeInsets.all(1.h),
                    decoration: BoxDecoration(color: themeButtonColor,borderRadius: BorderRadius.all(Radius.circular(1.h))),
                    child: const Text(
                      "Download (Ad)",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: modelApi!.comBitlinksChineseIptvM3ulist!.appUpdate!
                  .isUpdateRequire ==
                  true
                  ? 0.w
                  : 1.w,
            ),
          ],
        ),
        // confirm: Container(
        //   child: Text("Download App"),
        // ),
        radius: 3.h);
  })
      : Container();
}

aboutDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (a) {
        return SimpleDialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(2.h),
          alignment: Alignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10.h),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                children: [
                  Text(
                    "About Us",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 25.w),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const Text("Privacy Policy"),
                  InkWell(splashColor: Colors.transparent,highlightColor: Colors.transparent,
                    onTap: () {
                      launch(
                          "${modelApi!.comBitlinksChineseIptvM3ulist!.privacyPolicy!.privacyPolicy}");
                    },
                    child: const Text(
                      "https://privacypolicy.com",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const Divider(),
                  const Text("Terms & Conditions"),
                  InkWell(splashColor: Colors.transparent,highlightColor: Colors.transparent,
                    onTap: () {
                      launch(
                          "${modelApi!.comBitlinksChineseIptvM3ulist!.termsOfUse!.termsOfUse}");
                    },
                    child: const Text(
                      "https://termsandcondition.com",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const Divider(),
                  const Text("Contact"),
                  InkWell(splashColor: Colors.transparent,highlightColor: Colors.transparent,
                    onTap: () {
                      launch(
                          "${modelApi!.comBitlinksChineseIptvM3ulist!.feedbackSupport!.emailId}?subject=${modelApi!.comBitlinksChineseIptvM3ulist!.feedbackSupport!.emailSubject}&body=${modelApi!.comBitlinksChineseIptvM3ulist!.feedbackSupport!.emailMessage}");
                    },
                    child: Text(
                      "${modelApi!.comBitlinksChineseIptvM3ulist!.feedbackSupport!.emailId}",
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  )
                ],
              ),
            )
          ],
        );
      });
}
