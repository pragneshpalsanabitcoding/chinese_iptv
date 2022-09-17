import 'dart:convert';

import 'package:chinese_iptv/CheckInternet.dart';
import 'package:chinese_iptv/GetController.dart';
import 'package:chinese_iptv/SettingModel.dart';
import 'package:chinese_iptv/SplashScreen1.dart';
import 'package:chinese_iptv/provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_applovin_unity_ads/google_applovin_unity_ads.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  Controller.to.versionCode.value = int.parse(packageInfo.buildNumber);

  var connectivityResult = await (Connectivity().checkConnectivity());

  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    await fetchAlbum();

    if ((modelApi!.comBitlinksChineseIptvM3ulist ?? "").toString().isNotEmpty) {
      // modelApi!.comBitlinksChineseIptvM3ulist!.adsSequence![0]="google_ads";
      GoogleApplovinUnityAds.initialize(
          jsonEncode(modelApi?.comBitlinksChineseIptvM3ulist).toString(),
          callback: () => {runApp(const IPTV())});
    }
  } else {
    runApp(const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: CheckInternet(),
    ));
  }
}

Settings? modelApi;

class IPTV extends StatefulWidget {
  const IPTV({Key? key}) : super(key: key);

  static String oneSignalAppId =
      '${modelApi!.comBitlinksChineseIptvM3ulist!.adSetting!.onesignalId}';

  @override
  State<IPTV> createState() => _IPTVState();
}

class _IPTVState extends State<IPTV> {
  Future<void> initPlatformState() async {
    if (modelApi!.comBitlinksChineseIptvM3ulist!.privacyPolicy != null) {
      OneSignal.shared.setAppId(IPTV.oneSignalAppId);
      OneSignal.shared
          .promptUserForPushNotificationPermission()
          .then((accepted) {});
    }
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      );
    });
  }
}
