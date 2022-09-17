import 'package:chinese_iptv/OpenChannelScreen.dart';
import 'package:chinese_iptv/ads/Ads%20File.dart';
import 'package:chinese_iptv/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'Dialogs.dart';

class GetStartScreen extends StatefulWidget {
  const GetStartScreen({Key? key}) : super(key: key);

  @override
  State<GetStartScreen> createState() => _GetStartScreenState();
}

class _GetStartScreenState extends State<GetStartScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateDialoug();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async {
      return false;
    },
      child: Scaffold(
        backgroundColor: themColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(),
            Text("Free Download IPTV",
                style: TextStyle(fontSize: 3.h, color: Colors.white)),
            Center(
              child: Container(
                margin: EdgeInsets.only(
                    left: 4.sp, right: 4.sp, bottom: 10.h, top: 5.h),
                child: SizedBox(
                  child: Image.asset(getStartImage),
                ),
              ),
            ),
            const SizedBox(),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                IsFullAds(callback: () => {
                  Get.off(const OpenChannelScreen())});
              },
              child: Container(
                alignment: Alignment.center,
                width: 40.w,
                padding: EdgeInsets.all(1.5.h),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: downloadFileColor),
                child: Text(
                  "Get Start",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 7.w,
                  ),
                ),
              ),
            ),
            const SizedBox()
          ],
        ),
      ),
    );
  }
}
