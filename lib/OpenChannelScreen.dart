import 'dart:io';
import 'dart:math';

import 'package:chinese_iptv/Buttons.dart';
import 'package:chinese_iptv/Dialogs.dart';
import 'package:chinese_iptv/GetController.dart';
import 'package:chinese_iptv/ads/Ads%20File.dart';
import 'package:chinese_iptv/ads/OpenAds.dart';
import 'package:chinese_iptv/const.dart';
import 'package:chinese_iptv/main.dart';
import 'package:clipboard/clipboard.dart';
import 'package:dio/dio.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Guideline.dart';

class OpenChannelScreen extends StatefulWidget {
  const OpenChannelScreen({Key? key}) : super(key: key);

  @override
  State<OpenChannelScreen> createState() => _OpenChannelScreenState();
}

class _OpenChannelScreenState extends OpenAdState<OpenChannelScreen> {
  GlobalKey globalKey = GlobalKey();
  ScreenshotController screenshotController = ScreenshotController();
  final Directory pathhh =
      Directory("/storage/emulated/0/Download/$appbartitle");
  var link = modelApi?.comBitlinksChineseIptvM3ulist!.extraUrl;
  String datapath = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 0), () {
      checkFirstTime();
      updateDialoug();
    });
    pathhh.create();
  }

  checkFirstTime() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      bool? check = pref.getBool("guide");
      if (check == true) {
      } else {
        guideIntro(context);
      }
    });
  }

  guideIntro(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                child: Container(
                  margin: const EdgeInsets.only(left: 0.0, right: 0.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(
                          top: 25.0,
                        ),
                        margin: const EdgeInsets.only(top: 30.0, right: 8.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(16.0),
                            boxShadow: const <BoxShadow>[
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 0.0,
                                offset: Offset(0.0, 0.0),
                              ),
                            ]),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            SizedBox(
                              height: 5.h,
                            ),
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text("Welcome!",
                                  style: TextStyle(
                                      fontSize: 7.w,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ) //
                                ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Step 1",
                              style: TextStyle(
                                  color: downloadFileColor,
                                  fontSize: 5.w,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Text(
                              "Copy Link URL From download",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 4.w),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Step 2",
                              style: TextStyle(
                                  color: themColor,
                                  fontSize: 5.w,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Text(
                              "Paste URL In video player app",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 4.w),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Step 3",
                              style: TextStyle(
                                  color: qrCodeColor,
                                  fontSize: 5.w,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Text(
                              "Watch your favourite videos",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 4.w),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  SharedPreferences pref =
                                      await SharedPreferences.getInstance();

                                  pref.setBool("guide", true);

                                  Get.back();
                                },
                                child: buttonRed("Understood?")),
                            SizedBox(
                              height: 2.h,
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        left: 0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                playButtonImage,
                                height: 12.h,
                              )),
                        ),
                      ),
                    ],
                  ),
                )),
          );
        },
        context: context);
  }

  Future<String> downloadFile() async {
    try {
      Dio dio = Dio();
      datapath = pathhh.path;
      String filename = "$datapath/$fileSaveName${Random().nextInt(100)}.m3u";
      await dio.download(link!, filename);
      return filename;
    } catch (e) {
      return Future.value();
    }
  }

  Future takeScreenshot() async {
    String dirname = '${pathhh.path}/';
    pathhh.create();
    String filename = '$fileSaveName${Random().nextInt(100)}.png';

    final imageFile =
        await screenshotController.captureAndSave(dirname, fileName: filename);

    return imageFile;
  }

  fileDialog() {
    showDialog(
        builder: (context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              child: Container(
                margin: const EdgeInsets.only(left: 0.0, right: 0.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                        top: 25.0,
                      ),
                      margin: const EdgeInsets.only(top: 30.0, right: 8.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 0.0,
                              offset: Offset(0.0, 0.0),
                            ),
                          ]),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                            height: 5.h,
                          ),
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("File",
                                style: TextStyle(
                                    fontSize: 7.w,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ) //
                              ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Image.asset(
                            "images/fileimage.png",
                            height: 10.h,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            "Download file to your device and know everything",
                            style: TextStyle(
                                color: const Color(0xff707070), fontSize: 4.w),
                            textAlign: TextAlign.center,
                          ),
                          InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                Permission.storage.request().then((value) {
                                  Controller.to.isIntraAdsShow.value = true;
                                  IsFullAds(
                                      callback: () => {
                                            Controller.to.isIntraAdsShow.value =
                                                false,
                                            Rewardpopupfile(context)
                                          });
                                });
                              },
                              child: buttonRed("Download")),
                          InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await LaunchApp.openApp(
                                  androidPackageName:
                                      '${modelApi!.comBitlinksChineseIptvM3ulist!.iptvPlayerUrl}',
                                  iosUrlScheme: '',
                                  appStoreLink: '',
                                );
                                // Get.back();
                              },
                              child: yellowWhite("Watch on IPTV App")),
                          InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                downloadFile().then((value) {
                                  Share.shareFiles([value]);
                                });
                              },
                              child: buttonGrey("Share")),
                          SizedBox(
                            height: 2.h,
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              playButtonImage,
                              height: 13.h,
                            )),
                      ),
                    ),
                  ],
                ),
              ));
        },
        context: context);
  }

  linkDialog() {
    FlutterClipboard.copy(link!).then((value) => showDialog(
        builder: (context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              child: Container(
                margin: const EdgeInsets.only(left: 0.0, right: 0.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                        top: 25.0,
                      ),
                      margin: const EdgeInsets.only(top: 30.0, right: 8.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 0.0,
                              offset: Offset(0.0, 0.0),
                            ),
                          ]),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                            height: 5.h,
                          ),
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("Copy Link",
                                style: TextStyle(
                                    fontSize: 7.w,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ) //
                              ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Image.asset(
                            "images/linkimage.png",
                            height: 10.h,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.h),
                            child: Text(
                              "Copy link and you can watch live hd videos on your device",
                              style: TextStyle(
                                  color: const Color(0xff707070),
                                  fontSize: 4.w),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                Permission.storage.request().then((value) {
                                  Controller.to.isIntraAdsShow.value = true;
                                  IsFullAds(
                                      callback: () => {
                                            Controller.to.isIntraAdsShow.value =
                                                false,
                                            Rewardpopuplink(context)
                                          });
                                });
                              },
                              child: buttonRed("Copy Link")),
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              // var openAppResult =
                              await LaunchApp.openApp(
                                androidPackageName:
                                    '${modelApi!.comBitlinksChineseIptvM3ulist!.iptvPlayerUrl}',
                                iosUrlScheme: '',
                                appStoreLink: '',
                              );
                              // print('openAppResult => $openAppResult ${openAppResult.runtimeType}');
                              // Get.back();
                            },
                            child: yellowWhite("Watch on IPTV App"),
                          ),
                          InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                Share.share(
                                    "${modelApi!.comBitlinksChineseIptvM3ulist!.extraUrl}");
                              },
                              child: buttonGrey("Share")),
                          SizedBox(
                            height: 2.h,
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              playButtonImage,
                              height: 13.h,
                            )),
                      ),
                    ),
                  ],
                ),
              ));
        },
        context: context));
  }

  qrDialog() {
    showDialog(
        builder: (context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              child: Container(
                margin: const EdgeInsets.only(left: 0.0, right: 0.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                        top: 25.0,
                      ),
                      margin: const EdgeInsets.only(top: 30.0, right: 8.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 0.0,
                              offset: Offset(0.0, 0.0),
                            ),
                          ]),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                            height: 5.h,
                          ),
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("QR Code",
                                style: TextStyle(
                                    fontSize: 7.w,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          )),
                          RepaintBoundary(
                            key: globalKey,
                            child: Screenshot(
                              controller: screenshotController,
                              child: Container(
                                color: Colors.white,
                                child: Center(
                                  child: QrImage(
                                    data:
                                        "${modelApi!.comBitlinksChineseIptvM3ulist!.extraUrl}",
                                    version: QrVersions.auto,
                                    size: 170.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            "download QR Code and scan with any scanner",
                            style: TextStyle(
                                color: const Color(0xff707070), fontSize: 4.w),
                            textAlign: TextAlign.center,
                          ),
                          InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                Permission.storage.request().then((value) {
                                  Controller.to.isIntraAdsShow.value = true;
                                  IsFullAds(
                                      callback: () => {
                                            Controller.to.isIntraAdsShow.value =
                                                false,
                                            RewardpopupQR(context)
                                          });
                                });
                              },
                              child: buttonRed("Download")),
                          InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                // var openAppResult =
                                await LaunchApp.openApp(
                                  androidPackageName:
                                      '${modelApi!.comBitlinksChineseIptvM3ulist!.iptvPlayerUrl}',
                                  iosUrlScheme: '',
                                  appStoreLink: '',
                                );
                                // print('openAppResult => $openAppResult ${openAppResult.runtimeType}');
                                // Get.back();
                              },
                              child: yellowWhite("Watch on IPTV App")),
                          InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                takeScreenshot().then((value) async {
                                  Future.delayed(const Duration(seconds: 0),
                                      () {
                                    Share.shareFiles(["${(value)}"]);
                                  });
                                });
                              },
                              child: buttonGrey("Share")),
                          SizedBox(
                            height: 2.h,
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              playButtonImage,
                              height: 13.h,
                            )),
                      ),
                    ),
                  ],
                ),
              ));
        },
        context: context);
  }

  Rewardpopupfile(BuildContext context) {
    if (modelApi!.comBitlinksChineseIptvM3ulist!.adsSequence!.isNotEmpty) {
      if (modelApi!.comBitlinksChineseIptvM3ulist!.adSetting!.appVersionCode !=
          Controller.to.versionCode.value) {
        showDialog(
            barrierColor: const Color(0xff050505).withOpacity(0.75),
            barrierDismissible: false,
            context: context,
            builder: (a) {
              return WillPopScope(
                onWillPop: () async {
                  return false;
                },
                child: SimpleDialog(
                  contentPadding: EdgeInsets.only(right: 2.5.w),
                  backgroundColor: Colors.transparent,
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.white),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 1.5.h,
                              ),
                              Text(
                                "Reward Ad",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 6.5.w),
                              ),
                              SizedBox(
                                height: 2.5.h,
                              ),
                              Image.asset(
                                "images/new/popup_rewared.png",
                                height: 25.h,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.grey),
                                padding: EdgeInsets.all(1.h),
                                width: 100.w,
                                margin: EdgeInsets.only(
                                    left: 10.w, right: 10.w, top: 3.h),
                                child: Text(
                                  modelApi!.comBitlinksChineseIptvM3ulist!
                                      .rewardDialog!.rewardMessage!,
                                  style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  Navigator.pop(context);
                                  Controller.to.isRewardAdsShow.value = true;
                                  showRewardAds(
                                      callback: () => {
                                            Controller.to.isRewardAdsShow
                                                .value = false,
                                            downloadFile(),
                                            FlutterClipboard.copy(link!)
                                                .then((value) => showToast(
                                                      'Download Successfully',
                                                      context: context,
                                                      animation:
                                                          StyledToastAnimation
                                                              .fadeScale,
                                                      reverseAnimation:
                                                          StyledToastAnimation
                                                              .fadeScale,
                                                      position:
                                                          StyledToastPosition
                                                              .center,
                                                      animDuration:
                                                          const Duration(
                                                              seconds: 1),
                                                      duration: const Duration(
                                                          seconds: 2),
                                                      curve: Curves.elasticOut,
                                                      reverseCurve:
                                                          Curves.linear,
                                                    )),
                                            showDialog(
                                                builder: (context) {
                                                  return Dialog(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0)),
                                                      elevation: 0.0,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      child: Container(
                                                        margin: const EdgeInsets
                                                                .only(
                                                            left: 0.0,
                                                            right: 0.0),
                                                        child: Stack(
                                                          children: <Widget>[
                                                            Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                top: 25.0,
                                                              ),
                                                              margin:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 30.0,
                                                                      right:
                                                                          8.0),
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  shape: BoxShape
                                                                      .rectangle,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                  boxShadow: const <
                                                                      BoxShadow>[
                                                                    BoxShadow(
                                                                      color: Colors
                                                                          .black26,
                                                                      blurRadius:
                                                                          0.0,
                                                                      offset: Offset(
                                                                          0.0,
                                                                          0.0),
                                                                    ),
                                                                  ]),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .stretch,
                                                                children: <
                                                                    Widget>[
                                                                  SizedBox(
                                                                    height: 5.h,
                                                                  ),
                                                                  Center(
                                                                      child:
                                                                          Padding(
                                                                    padding: const EdgeInsets
                                                                            .all(
                                                                        10.0),
                                                                    child: Text(
                                                                        "Download Successfully",
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                5.w,
                                                                            color: Colors.black,
                                                                            fontWeight: FontWeight.bold)),
                                                                  ) //
                                                                      ),
                                                                  InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () {
                                                                        showIntraAds(
                                                                            callback: () =>
                                                                                {
                                                                                  Get.to(const GuideFile())
                                                                                });
                                                                      },
                                                                      child: buttonGrey(
                                                                          "How to use")),
                                                                  InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        // var openAppResult =
                                                                        await LaunchApp
                                                                            .openApp(
                                                                          androidPackageName:
                                                                              '${modelApi!.comBitlinksChineseIptvM3ulist!.iptvPlayerUrl}',
                                                                          iosUrlScheme:
                                                                              '',
                                                                          appStoreLink:
                                                                              '',
                                                                        );
                                                                        // print('openAppResult => $openAppResult ${openAppResult.runtimeType}');
                                                                        // Get.back();
                                                                      },
                                                                      child: yellowWhite(
                                                                          "Watch on IPTV App")),
                                                                  SizedBox(
                                                                    height: 2.h,
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            Positioned(
                                                              right: 0,
                                                              left: 0,
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child: Image
                                                                        .asset(
                                                                      playButtonImage,
                                                                      height:
                                                                          13.h,
                                                                    )),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ));
                                                },
                                                context: context)
                                          });
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.red),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6.w, vertical: 1.5.h),
                                  child: Text(
                                    "Watch Ad",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 5.w),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                            ],
                          ),
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: EdgeInsets.all(2.h),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xffFFFFFF)
                                          .withOpacity(0.14)),
                                  child: Icon(
                                    Icons.close,
                                    size: 8.w,
                                    color: Colors.black,
                                  ),
                                ),
                                onTap: () {
                                  Get.back();
                                },
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              );
            });
      } else {}
    }
  }

  Rewardpopuplink(BuildContext context) {
    if (modelApi!.comBitlinksChineseIptvM3ulist!.adsSequence!.isNotEmpty) {
      if (modelApi!.comBitlinksChineseIptvM3ulist!.adSetting!.appVersionCode !=
          Controller.to.versionCode.value) {
        showDialog(
            barrierColor: const Color(0xff050505).withOpacity(0.75),
            barrierDismissible: false,
            context: context,
            builder: (a) {
              return WillPopScope(
                onWillPop: () async {
                  return false;
                },
                child: SimpleDialog(
                  contentPadding: EdgeInsets.only(right: 2.5.w),
                  backgroundColor: Colors.transparent,
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.white),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 1.5.h,
                              ),
                              Text(
                                "Reward Ad",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 6.5.w),
                              ),
                              SizedBox(
                                height: 2.5.h,
                              ),
                              Image.asset(
                                "images/new/popup_rewared.png",
                                height: 25.h,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.grey),
                                padding: EdgeInsets.all(1.h),
                                width: 100.w,
                                margin: EdgeInsets.only(
                                    left: 10.w, right: 10.w, top: 3.h),
                                child: Text(
                                  modelApi!.comBitlinksChineseIptvM3ulist!
                                      .rewardDialog!.rewardMessage!,
                                  style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  Navigator.pop(context);
                                  Controller.to.isRewardAdsShow.value = true;
                                  showRewardAds(
                                      callback: () => {
                                            Controller.to.isRewardAdsShow
                                                .value = false,
                                            FlutterClipboard.copy(
                                                    '${modelApi!.comBitlinksChineseIptvM3ulist!.extraUrl}')
                                                .then((value) => showToast(
                                                      'Copy Successfully',
                                                      context: context,
                                                      animation:
                                                          StyledToastAnimation
                                                              .fadeScale,
                                                      reverseAnimation:
                                                          StyledToastAnimation
                                                              .fadeScale,
                                                      position:
                                                          StyledToastPosition
                                                              .center,
                                                      animDuration:
                                                          const Duration(
                                                              seconds: 1),
                                                      duration: const Duration(
                                                          seconds: 2),
                                                      curve: Curves.elasticOut,
                                                      reverseCurve:
                                                          Curves.linear,
                                                    )),
                                            showDialog(
                                                builder: (context) {
                                                  return Dialog(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0)),
                                                      elevation: 0.0,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      child: Container(
                                                        margin: const EdgeInsets
                                                                .only(
                                                            left: 0.0,
                                                            right: 0.0),
                                                        child: Stack(
                                                          children: <Widget>[
                                                            Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                top: 25.0,
                                                              ),
                                                              margin:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 30.0,
                                                                      right:
                                                                          8.0),
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  shape: BoxShape
                                                                      .rectangle,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                  boxShadow: const <
                                                                      BoxShadow>[
                                                                    BoxShadow(
                                                                      color: Colors
                                                                          .black26,
                                                                      blurRadius:
                                                                          0.0,
                                                                      offset: Offset(
                                                                          0.0,
                                                                          0.0),
                                                                    ),
                                                                  ]),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .stretch,
                                                                children: <
                                                                    Widget>[
                                                                  SizedBox(
                                                                    height: 5.h,
                                                                  ),
                                                                  Center(
                                                                      child:
                                                                          Padding(
                                                                    padding: const EdgeInsets
                                                                            .all(
                                                                        10.0),
                                                                    child: Text(
                                                                        "Download Successfully",
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                5.w,
                                                                            color: Colors.black,
                                                                            fontWeight: FontWeight.bold)),
                                                                  ) //
                                                                      ),
                                                                  InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () {
                                                                        showIntraAds(
                                                                            callback: () =>
                                                                                {
                                                                                  Get.to(const GuideLink())
                                                                                });
                                                                      },
                                                                      child: buttonGrey(
                                                                          "How to use")),
                                                                  InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        // var openAppResult =
                                                                        await LaunchApp
                                                                            .openApp(
                                                                          androidPackageName:
                                                                              '${modelApi!.comBitlinksChineseIptvM3ulist!.iptvPlayerUrl}',
                                                                          iosUrlScheme:
                                                                              '',
                                                                          appStoreLink:
                                                                              '',
                                                                        );
                                                                        // print('openAppResult => $openAppResult ${openAppResult.runtimeType}');
                                                                        // Get.back();
                                                                      },
                                                                      child: yellowWhite(
                                                                          "Watch on IPTV App")),
                                                                  SizedBox(
                                                                    height: 2.h,
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            Positioned(
                                                              right: 0,
                                                              left: 0,
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child: Image
                                                                        .asset(
                                                                      playButtonImage,
                                                                      height:
                                                                          13.h,
                                                                    )),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ));
                                                },
                                                context: context)
                                          });
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.red),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6.w, vertical: 1.5.h),
                                  child: Text(
                                    "Watch Ad",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 5.w),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                            ],
                          ),
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: EdgeInsets.all(2.h),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xffFFFFFF)
                                          .withOpacity(0.14)),
                                  child: Icon(
                                    Icons.close,
                                    size: 8.w,
                                    color: Colors.black,
                                  ),
                                ),
                                onTap: () {
                                  Get.back();
                                },
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              );
            });
      } else {}
    }
  }

  RewardpopupQR(BuildContext context) {
    if (modelApi!.comBitlinksChineseIptvM3ulist!.adsSequence!.isNotEmpty) {
      if (modelApi!.comBitlinksChineseIptvM3ulist!.adSetting!.appVersionCode !=
          Controller.to.versionCode.value) {
        showDialog(
            barrierColor: const Color(0xff050505).withOpacity(0.75),
            barrierDismissible: false,
            context: context,
            builder: (a) {
              return WillPopScope(
                onWillPop: () async {
                  return false;
                },
                child: SimpleDialog(
                  contentPadding: EdgeInsets.only(right: 2.5.w),
                  backgroundColor: Colors.transparent,
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.white),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 1.5.h,
                              ),
                              Text(
                                "Reward Ad",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 6.5.w),
                              ),
                              SizedBox(
                                height: 2.5.h,
                              ),
                              Image.asset(
                                "images/new/popup_rewared.png",
                                height: 25.h,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.grey),
                                padding: EdgeInsets.all(1.h),
                                width: 100.w,
                                margin: EdgeInsets.only(
                                    left: 10.w, right: 10.w, top: 3.h),
                                child: Text(
                                  modelApi!.comBitlinksChineseIptvM3ulist!
                                      .rewardDialog!.rewardMessage!,
                                  style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  Navigator.pop(context);
                                  Controller.to.isRewardAdsShow.value = true;
                                  showRewardAds(
                                      callback: () => {
                                            Controller.to.isRewardAdsShow
                                                .value = false,
                                            takeScreenshot(),
                                            FlutterClipboard.copy(
                                                    '${modelApi!.comBitlinksChineseIptvM3ulist!.extraUrl}')
                                                .then((value) {
                                              showToast(
                                                'Download Successfully',
                                                context: context,
                                                animation: StyledToastAnimation
                                                    .fadeScale,
                                                reverseAnimation:
                                                    StyledToastAnimation
                                                        .fadeScale,
                                                position:
                                                    StyledToastPosition.center,
                                                animDuration:
                                                    const Duration(seconds: 1),
                                                duration:
                                                    const Duration(seconds: 2),
                                                curve: Curves.elasticOut,
                                                reverseCurve: Curves.linear,
                                              );
                                            }),
                                            showDialog(
                                                builder: (context) {
                                                  return Dialog(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0)),
                                                      elevation: 0.0,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      child: Container(
                                                        margin: const EdgeInsets
                                                                .only(
                                                            left: 0.0,
                                                            right: 0.0),
                                                        child: Stack(
                                                          children: <Widget>[
                                                            Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                top: 25.0,
                                                              ),
                                                              margin:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 30.0,
                                                                      right:
                                                                          8.0),
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  shape: BoxShape
                                                                      .rectangle,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                  boxShadow: const <
                                                                      BoxShadow>[
                                                                    BoxShadow(
                                                                      color: Colors
                                                                          .black26,
                                                                      blurRadius:
                                                                          0.0,
                                                                      offset: Offset(
                                                                          0.0,
                                                                          0.0),
                                                                    ),
                                                                  ]),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .stretch,
                                                                children: <
                                                                    Widget>[
                                                                  SizedBox(
                                                                    height: 5.h,
                                                                  ),
                                                                  Center(
                                                                      child:
                                                                          Padding(
                                                                    padding: const EdgeInsets
                                                                            .all(
                                                                        10.0),
                                                                    child: Text(
                                                                        "Download Successfully",
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                5.w,
                                                                            color: Colors.black,
                                                                            fontWeight: FontWeight.bold)),
                                                                  ) //
                                                                      ),
                                                                  InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () {
                                                                        showIntraAds(
                                                                            callback: () =>
                                                                                {
                                                                                  Get.to(const GuideQr())
                                                                                });
                                                                      },
                                                                      child: buttonGrey(
                                                                          "How to use")),
                                                                  InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        // var openAppResult =
                                                                        await LaunchApp
                                                                            .openApp(
                                                                          androidPackageName:
                                                                              '${modelApi!.comBitlinksChineseIptvM3ulist!.iptvPlayerUrl}',
                                                                          iosUrlScheme:
                                                                              '',
                                                                          appStoreLink:
                                                                              '',
                                                                        );
                                                                        // print('openAppResult => $openAppResult ${openAppResult.runtimeType}');
                                                                        // Get.back();
                                                                      },
                                                                      child: yellowWhite(
                                                                          "Watch on IPTV App")),
                                                                  SizedBox(
                                                                    height: 2.h,
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            Positioned(
                                                              right: 0,
                                                              left: 0,
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child: Image
                                                                        .asset(
                                                                      playButtonImage,
                                                                      height:
                                                                          13.h,
                                                                    )),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ));
                                                },
                                                context: context)
                                          });
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.red),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6.w, vertical: 1.5.h),
                                  child: Text(
                                    "Watch Ad",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 5.w),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                            ],
                          ),
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: EdgeInsets.all(2.h),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xffFFFFFF)
                                          .withOpacity(0.14)),
                                  child: Icon(
                                    Icons.close,
                                    size: 8.w,
                                    color: Colors.black,
                                  ),
                                ),
                                onTap: () {
                                  Get.back();
                                },
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              );
            });
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: EdgeInsets.all(1.h),
                child: PopupMenuButton(
                  color: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  iconSize: 3.h,
                  itemBuilder: (ctx) => [
                    _buildPopupMenuItem('Privacy Policy', () {
                      launch(
                          "${modelApi!.comBitlinksChineseIptvM3ulist!.privacyPolicy!.privacyPolicy}");
                    }, ""),
                    _buildPopupMenuItem('Rate us', () {
                      Future.delayed(const Duration(seconds: 0), () {
                        showDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierColor: Colors.black45,
                            useSafeArea: true,
                            // set to false if you want to force a rating
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
                                    '${modelApi?.comBitlinksChineseIptvM3ulist!.rateApp!.rateMessage}',
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
                                        description:
                                            const Text("We Will Improve App"),
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
                      });
                    }, ""),
                    _buildPopupMenuItem('More App', () {
                      launch(
                          "${modelApi!.comBitlinksChineseIptvM3ulist!.moreAppUrl}");
                    }, "(Ad)"),
                    _buildPopupMenuItem('Terms & Conditions', () {
                      launch(
                          "${modelApi!.comBitlinksChineseIptvM3ulist!.termsOfUse!.termsOfUse}");
                    }, ""),
                    _buildPopupMenuItem('Feedback', () {
                      launch(
                          "${modelApi!.comBitlinksChineseIptvM3ulist!.feedbackSupport!.emailId}?subject=${modelApi!.comBitlinksChineseIptvM3ulist!.feedbackSupport!.emailSubject}&body=${modelApi!.comBitlinksChineseIptvM3ulist!.feedbackSupport!.emailMessage}");
                    }, ""),
                    _buildPopupMenuItem('About Us', () {
                      Future.delayed(const Duration(seconds: 0), () {
                        showAboutUs(context);
                      });
                    }, ""),
                    _buildPopupMenuItem('Exit', () {
                      Future.delayed(const Duration(seconds: 0), () {
                        exitDialog(context);
                      });
                    }, ""),
                  ],
                  child: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ),
              )
            ],
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
            title: Text(appbartitle, style: TextStyle(fontSize: 3.h)),
          ),
          backgroundColor: themColor,
          bottomNavigationBar: bannerAds(),
          body: SizedBox(
            height: 100.h,
            width: 100.w,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                  child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      mediumNativeAds(),
                      SizedBox(
                        height: 4.h,
                      ),
                      //todo downloadFileButton
                      Container(
                        height: 10.h,
                        width: 84.w,
                        decoration: const BoxDecoration(
                            color: Colors.transparent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                Permission.storage.request().then((value) {
                                  Controller.to.isIntraAdsShow.value = true;
                                  showIntraAds(
                                      callback: () => {
                                            Controller.to.isIntraAdsShow.value =
                                                false,
                                            fileDialog()
                                          });
                                });
                              },
                              child: Stack(
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 9.w),
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: downloadFileColor,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10))),
                                        height: 8.h,
                                        width: 45.w,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 5.w),
                                          child: Text(
                                            "File",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                                fontSize: 5.w),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      height: 6.h,
                                      width: 6.h,
                                      margin: EdgeInsets.all(2.h),
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(200)),
                                      ),
                                      padding: EdgeInsets.all(1.5.h),
                                      child: Image.asset(
                                        downloadFileImage,
                                        color: downloadFileColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                IsFullAds(
                                    callback: () =>
                                        {Get.to(() => const GuideFile())});
                              },
                              child: Stack(
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 3.w),
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                            color: Color(0x1affffff),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        height: 8.h,
                                        width: 20.w,
                                        child: Text(
                                          "Guide",
                                          style: TextStyle(
                                              // fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              fontSize: 5.w),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),

                      //todo linkButton
                      Container(
                        height: 10.h,
                        width: 84.w,
                        decoration: const BoxDecoration(
                            color: Colors.transparent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                Permission.storage.request().then((value) {
                                  Controller.to.isIntraAdsShow.value = true;
                                  showIntraAds(
                                      callback: () => {
                                            Controller.to.isIntraAdsShow.value =
                                                false,
                                            linkDialog()
                                          });
                                });
                              },
                              child: Stack(
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 9.w),
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: linkColor,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10))),
                                        height: 8.h,
                                        width: 45.w,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 5.w),
                                          child: Text(
                                            "Link",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                                fontSize: 5.w),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      margin: EdgeInsets.all(2.h),
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(200))),
                                      padding: EdgeInsets.all(1.5.h),
                                      child: Image.asset(
                                        linkImage,
                                        color: linkColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                IsFullAds(
                                    callback: () =>
                                        {Get.to(() => const GuideLink())});
                              },
                              child: Stack(
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 3.w),
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                            color: Color(0x1affffff),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        height: 8.h,
                                        width: 20.w,
                                        child: Text(
                                          "Guide",
                                          style: TextStyle(
                                              // fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              fontSize: 5.w),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),

                      //todo qrCodeButton
                      Container(
                        height: 10.h,
                        width: 84.w,
                        decoration: const BoxDecoration(
                            color: Colors.transparent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                Permission.storage.request().then((value) {
                                  Controller.to.isIntraAdsShow.value = true;
                                  showIntraAds(
                                      callback: () => {
                                            Controller.to.isIntraAdsShow.value =
                                                false,
                                            qrDialog()
                                          });
                                });
                              },
                              child: Stack(
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 9.w),
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: qrCodeColor,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10))),
                                        height: 8.h,
                                        width: 45.w,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 5.w),
                                          child: Text(
                                            "QR Code",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                                fontSize: 5.w),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      margin: EdgeInsets.all(2.h),
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(200))),
                                      padding: EdgeInsets.all(1.5.h),
                                      child: Image.asset(
                                        qrCodeImage,
                                        color: qrCodeColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                IsFullAds(
                                    callback: () =>
                                        {Get.to(() => const GuideQr())});
                              },
                              child: Stack(
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 3.w),
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                            color: Color(0x1affffff),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        height: 8.h,
                                        width: 20.w,
                                        child: Text(
                                          "Guide",
                                          style: TextStyle(
                                              // fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              fontSize: 5.w),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      IsFullAdsNative(),
                    ]),
              )),
            ),
          ),
        ),
        onWillPop: () async {
          exitDialog(context);
          return false;
        });
  }
}

PopupMenuItem _buildPopupMenuItem(
    String title, VoidCallback? tapEvent, var ad) {
  return PopupMenuItem(
    onTap: tapEvent,
    child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
      SizedBox(width: 2.w),
      Align(
        alignment: Alignment.topRight,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
          child: Text(
            "$ad",
            style: TextStyle(fontSize: 3.2.w, color: Colors.grey),
          ),
        ),
      ),
    ]),
  );
}
