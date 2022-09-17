
import 'package:flutter/material.dart';
import 'package:google_applovin_unity_ads/google_applovin_unity_ads.dart';

import '../GetController.dart';

abstract class OpenAdState<T extends StatefulWidget> extends State<T> with WidgetsBindingObserver {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // print('stateeeeeeeeee=========$state');
    if (state == AppLifecycleState.resumed) {
      // print('resumeeeeeeeeeeeeeee=========AppLifecycleState.resumed');
      if(!Controller.to.isAdShow.value && !Controller.to.isRewardAdsShow.value && !Controller.to.isIntraAdsShow.value) {
        // print('controllerrrrrrrr========121212121212');
        GoogleApplovinUnityAds.showOpenAds(callback: () => {
          // print('wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww'),
        Controller.to.isAdShow.value = true
        });
      }
    }

    if (state == AppLifecycleState.paused) {
      // print('stateeeeeeeeee=========9999999999999999999999999999');
      Controller.to.isAdShow.value = false;
    }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

}