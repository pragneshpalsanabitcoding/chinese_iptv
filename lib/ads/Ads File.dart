import 'package:chinese_iptv/GetController.dart';
import 'package:flutter/material.dart';
import 'package:google_applovin_unity_ads/google_applovin_unity_ads.dart';
import 'package:google_applovin_unity_ads/native/controller.dart';

import 'package:sizer/sizer.dart';
import '../main.dart';

showIntraAds({Function? callback}) async {
  print('intraaaaaa Steppppppp ============== 1111111111111');
  if (modelApi!.comBitlinksChineseIptvM3ulist!.adSetting!.appVersionCode ==
      Controller.to.versionCode.value) {
    print('intraaaaaa Steppppppp ============== 222222222222222222');
    if (callback != null) {
  print('intraaaaaa Steppppppp ============== 3333333333333333333');
      callback();
    }
  } else {
  print('intraaaaaa Steppppppp ============== 4444444444444444444');
    GoogleApplovinUnityAds.showIntraAds(callback: callback);
  }
}

Future<void> showRewardAds({Function? callback}) async {
  if (modelApi!.comBitlinksChineseIptvM3ulist!.adSetting!.appVersionCode ==
      Controller.to.versionCode.value) {
    if (callback != null) {
      callback();
    }
  } else {
    GoogleApplovinUnityAds.showRewardAds(callback: callback);
  }
}

bannerAds() {
  if (modelApi!.comBitlinksChineseIptvM3ulist!.adSetting!.appVersionCode ==
          Controller.to.versionCode.value ||
      modelApi!.comBitlinksChineseIptvM3ulist!.adsSequence!.isEmpty) {
    return Container(
      height: 0,
    );
  }

  return GoogleApplovinUnityAds.bannerAds();
}

fullNativeAds() {
  if (modelApi!.comBitlinksChineseIptvM3ulist!.adSetting!.appVersionCode ==
          Controller.to.versionCode.value ||
      modelApi!.comBitlinksChineseIptvM3ulist!.adsSequence!.isEmpty ||
      (modelApi!.comBitlinksChineseIptvM3ulist!.adsSequence!.length == 1 &&
          modelApi!.comBitlinksChineseIptvM3ulist!.adsSequence![0] ==
              "custom_ads")) {
    return Container(
      height: 0,
    );
  }
  return GoogleApplovinUnityAds.nativeAds(
      NativeSize(Size(double.infinity, 50.h)), "F",
      error: Container(
        height: 0,
      ));
}

mediumNativeAds() {
  if (modelApi!.comBitlinksChineseIptvM3ulist!.adSetting!.appVersionCode ==
          Controller.to.versionCode.value ||
      modelApi!.comBitlinksChineseIptvM3ulist!.adsSequence!.isEmpty ||
      (modelApi!.comBitlinksChineseIptvM3ulist!.adsSequence!.length == 1 &&
          modelApi!.comBitlinksChineseIptvM3ulist!.adsSequence![0] ==
              "custom_ads")) {
    return Container(
      height: 0,
    );
  }
  return GoogleApplovinUnityAds.nativeAds(
      NativeSize(Size(double.infinity, 20.h)), "M");
}

showOpenAd() {
  if (modelApi!.comBitlinksChineseIptvM3ulist!.adSetting!.appVersionCode ==
          Controller.to.versionCode.value ||
      modelApi!.comBitlinksChineseIptvM3ulist!.adsSequence!.isEmpty) {
    return;
  }

  GoogleApplovinUnityAds.showOpenAds();
}

smallNativeAds() {
  if (modelApi!.comBitlinksChineseIptvM3ulist!.adSetting!.appVersionCode ==
          Controller.to.versionCode.value ||
      modelApi!.comBitlinksChineseIptvM3ulist!.adsSequence!.isEmpty ||
      (modelApi!.comBitlinksChineseIptvM3ulist!.adsSequence!.length == 1 &&
          modelApi!.comBitlinksChineseIptvM3ulist!.adsSequence![0] ==
              "custom_ads")) {
    return Container(
      height: 0,
    );
  }
  return GoogleApplovinUnityAds.nativeAds(
      NativeSize(Size(double.infinity, 16.h)), "S");
}

IsFullAds({Function? callback}) {
  if (modelApi!.comBitlinksChineseIptvM3ulist!.adSetting!.isFullAds == true) {
    showIntraAds(callback: callback);
  } else {
    if (callback != null) {
      callback();
    }
  }
}

IsFullAdsNative() {
  return modelApi!.comBitlinksChineseIptvM3ulist!.adSetting!.isFullAds == true
      ? mediumNativeAds()
      : Container();
}
