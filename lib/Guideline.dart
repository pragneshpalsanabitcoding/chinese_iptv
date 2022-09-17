import 'package:chinese_iptv/GetController.dart';
import 'package:chinese_iptv/OpenChannelScreen.dart';
import 'package:chinese_iptv/ads/Ads%20File.dart';
import 'package:chinese_iptv/ads/OpenAds.dart';
import 'package:chinese_iptv/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class GuideFile extends StatefulWidget {
  const GuideFile({Key? key}) : super(key: key);

  @override
  State<GuideFile> createState() => _GuideFileState();
}

class _GuideFileState extends State<GuideFile> {
  bool lottiStatus = false;

  final List<Widget> _list = <Widget>[
    const Center(child: GuideFile1()),
    const Center(child: GuideFile2()),
    const Center(child: GuideFile3()),
    const Center(child: GuideFile4())
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: PageView(
      onPageChanged: (value) {
        IsFullAds();
        Controller.to.lottistatus.value = true;
      },
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: _list,
    ), onWillPop: () async {
      Get.back();
      return true;
    });
  }
}

//File guide page 1
class GuideFile1 extends StatefulWidget {
  const GuideFile1({Key? key}) : super(key: key);

  @override
  State<GuideFile1> createState() => _GuideFile1State();
}

class _GuideFile1State extends State<GuideFile1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B091C),
      bottomNavigationBar: bannerAds(),
      body: Center(
          child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 3.5.h),
            width: double.infinity,
            height: 80.h,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/fileguide1.png"))),
          ),
         Obx(() =>  Controller.to.lottistatus.value == false
             ? Positioned(
             left: 25.w,
             top: 50.h,
             child: SizedBox(
               height: 15.h,
               child: Lottie.asset(lottiess),
             ))
             : const SizedBox()),
        ],
      )),
    );
  }
}

//File guide page 2
class GuideFile2 extends StatefulWidget {
  const GuideFile2({Key? key}) : super(key: key);

  @override
  State<GuideFile2> createState() => _GuideFile2State();
}

class _GuideFile2State extends State<GuideFile2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B091C),
      bottomNavigationBar: bannerAds(),
      body: Center(
          child: Column(
        children: [
          Padding(padding: EdgeInsets.all(2.5.h)),
          Container(
            margin: EdgeInsets.only(bottom: 3.h),
            width: double.infinity,
            height: 80.h,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/fileguide2.png"))),
          ),
        ],
      )),
    );
  }
}

//File guide page 3
class GuideFile3 extends StatefulWidget {
  const GuideFile3({Key? key}) : super(key: key);

  @override
  State<GuideFile3> createState() => _GuideFile3State();
}

class _GuideFile3State extends State<GuideFile3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B091C),
      bottomNavigationBar: bannerAds(),
      body: Center(
          child: Column(
        children: [
          Padding(padding: EdgeInsets.all(2.5.h)),
          Container(
            margin: EdgeInsets.only(bottom: 3.h),
            width: double.infinity,
            height: 80.h,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/fileguide3.png"))),
          ),

        ],
      )),
    );
  }
}

//File guide page 4
class GuideFile4 extends StatefulWidget {
  const GuideFile4({Key? key}) : super(key: key);

  @override
  State<GuideFile4> createState() => _GuideFile4State();
}

class _GuideFile4State extends State<GuideFile4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B091C),
      bottomNavigationBar: bannerAds(),
      body: Center(
          child: Column(
        children: [
          Padding(padding: EdgeInsets.all(2.5.h)),
          Container(
            margin: EdgeInsets.only(bottom: 1.h),
            width: double.infinity,
            height: 80.h,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/linkguide4.png"))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: double.minPositive),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  IsFullAds(callback: ()=>{
                  Get.back()
                  });

                },
                child: Container(
                  height: 5.5.h,
                  width: 30.w,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                  ),
                  child: Text("Finish",
                      style: TextStyle(
                          color: const Color(0xff0B091C), fontSize: 2.5.h)),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}

class GuideLink extends StatefulWidget {
  const GuideLink({Key? key}) : super(key: key);

  @override
  State<GuideLink> createState() => _GuideLinkState();
}

class _GuideLinkState extends State<GuideLink> {
  final List<Widget> _list1 = <Widget>[
    const Center(child: LinkGuide1()),
    const Center(child: LinkGuide2()),
    const Center(child: LinkGuide3()),
    const Center(child: LinkGuide4())
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async{
      Get.back();
      return true;
    },
      child: PageView(
        onPageChanged: (value) {
          IsFullAds();
          Controller.to.lottistatus.value = true;
        },
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: _list1,
      ),
    );
  }
}

//Link guide page 1
class LinkGuide1 extends StatefulWidget {
  const LinkGuide1({Key? key}) : super(key: key);

  @override
  State<LinkGuide1> createState() => _LinkGuide1State();
}

class _LinkGuide1State extends State<LinkGuide1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B091C),
      bottomNavigationBar: bannerAds(),
      body: Center(
          child: Stack(
        children: [

          Container(
            margin: EdgeInsets.only(bottom: 3.5.h),
            width: double.infinity,
            height: 80.h,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/linkguide1.png"))),
            // )
          ),
          Obx(() => Controller.to.lottistatus.value == false
              ? Positioned(
              left: 25.w,
              top: 50.h,
              child: SizedBox(
                height: 15.h,
                child: Lottie.asset(lottiess),
              ))
              : SizedBox(
            height: 15.h,
          )),
        ],
      )),
    );
  }
}

//Link guide page 2
class LinkGuide2 extends StatefulWidget {
  const LinkGuide2({Key? key}) : super(key: key);

  @override
  State<LinkGuide2> createState() => _LinkGuide2State();
}

class _LinkGuide2State extends State<LinkGuide2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B091C),
      bottomNavigationBar: bannerAds(),
      body: Center(
          child: Column(
        children: [
          Padding(padding: EdgeInsets.all(2.5.h)),
          Container(
            margin: EdgeInsets.only(bottom: 3.h),
            width: double.infinity,
            height: 80.h,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/linkguide2.png"))),
          ),
        ],
      )),
    );
  }
}

//Link guide page 3
class LinkGuide3 extends StatefulWidget {
  const LinkGuide3({Key? key}) : super(key: key);

  @override
  State<LinkGuide3> createState() => _LinkGuide3State();
}

class _LinkGuide3State extends State<LinkGuide3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B091C),
      bottomNavigationBar: bannerAds(),
      body: Center(
          child: Column(
        children: [
          Padding(padding: EdgeInsets.all(2.5.h)),
          Container(
            margin: EdgeInsets.only(bottom: 3.h),
            width: double.infinity,
            height: 80.h,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/linkguide3.png"))),
          ),
        ],
      )),
    );
  }
}

//Link guide page 4
class LinkGuide4 extends StatefulWidget {
  const LinkGuide4({Key? key}) : super(key: key);

  @override
  State<LinkGuide4> createState() => _LinkGuide4State();
}

class _LinkGuide4State extends State<LinkGuide4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B091C),
      bottomNavigationBar: bannerAds(),
      body: Center(
          child: Column(
        children: [
          Padding(padding: EdgeInsets.all(2.5.h)),
          Container(
            margin: EdgeInsets.only(bottom: 1.h),
            width: double.infinity,
            height: 80.h,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/linkguide4.png"))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: double.minPositive),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                   IsFullAds(callback: ()=>{
                   Get.back()
                   });

                },
                child: Container(
                  height: 5.5.h,
                  width: 30.w,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                  ),
                  child: Text("Finish",
                      style: TextStyle(
                          color: const Color(0xff0B091C), fontSize: 2.5.h)),
                ),

              ),
            ],
          ),
          SizedBox(
            height: 1.h,
          )
        ],
      )),
    );
  }
}

class GuideQr extends StatefulWidget {
  const GuideQr({Key? key}) : super(key: key);

  @override
  State<GuideQr> createState() => _GuideQrState();
}

class _GuideQrState extends State<GuideQr> {
  final List<Widget> _list2 = <Widget>[
    const Center(child: QRGuide1()),
    const Center(child: QRGuide2()),
    const Center(child: QRGuide3()),
    const Center(child: QRGuide4())
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async {
      Get.back();
      return true;
    },
      child: PageView(
        onPageChanged: (value) {
          IsFullAds();
          Controller.to.lottistatus.value = true;
        },
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: _list2,
      ),
    );
  }
}

//QR guide page 1
class QRGuide1 extends StatefulWidget {
  const QRGuide1({Key? key}) : super(key: key);

  @override
  State<QRGuide1> createState() => _QRGuide1State();
}

class _QRGuide1State extends State<QRGuide1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B091C),
      bottomNavigationBar: bannerAds(),
      body: Center(
          child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 3.5.h),
            width: double.infinity,
            height: 80.h,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("images/QRguide1.png"),
            )),
          ),
          Obx(() => Controller.to.lottistatus.value == false
              ? Positioned(
              left: 25.w,
              top: 50.h,
              child: SizedBox(
                height: 15.h,
                child: Lottie.asset(lottiess),
              ))
              : SizedBox(
            height: 15.h,
          )),
        ],
      )),
    );
  }
}

//QR guide page 2
class QRGuide2 extends StatefulWidget {
  const QRGuide2({Key? key}) : super(key: key);

  @override
  State<QRGuide2> createState() => _QRGuide2State();
}

class _QRGuide2State extends State<QRGuide2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B091C),
      bottomNavigationBar: bannerAds(),
      body: Center(
          child: Column(
        children: [
          Padding(padding: EdgeInsets.all(2.5.h)),
          Container(
            margin: EdgeInsets.only(bottom: 3.h),
            width: double.infinity,
            height: 80.h,
            decoration: const BoxDecoration(
                image:
                    DecorationImage(image: AssetImage("images/QRguide2.png"))),
          ),
        ],
      )),
    );
  }
}

//QR guide page 3
class QRGuide3 extends StatefulWidget {
  const QRGuide3({Key? key}) : super(key: key);

  @override
  State<QRGuide3> createState() => _QRGuide3State();
}

class _QRGuide3State extends State<QRGuide3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B091C),
      bottomNavigationBar: bannerAds(),
      body: Center(
          child: Column(
        children: [
          Padding(padding: EdgeInsets.all(2.5.h)),
          Container(
            margin: EdgeInsets.only(bottom: 3.h),
            width: double.infinity,
            height: 80.h,
            decoration: const BoxDecoration(
                image:
                    DecorationImage(image: AssetImage("images/QRguide3.png"))),
          ),
        ],
      )),
    );
  }
}

//QR guide page 4
class QRGuide4 extends StatefulWidget {
  const QRGuide4({Key? key}) : super(key: key);

  @override
  State<QRGuide4> createState() => _QRGuide4State();
}

class _QRGuide4State extends State<QRGuide4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B091C),
      bottomNavigationBar: bannerAds(),
      body: Center(
          child: Column(
        children: [
          Padding(padding: EdgeInsets.all(2.5.h)),
          Container(
            margin: EdgeInsets.only(bottom: 1.h),
            width: double.infinity,
            height: 80.h,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/linkguide4.png"))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: double.minPositive),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                   IsFullAds();
                  Get.back();
                },
                child: Container(
                  height: 5.5.h,
                  width: 30.w,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                  ),
                  child: Text("Finish",
                      style: TextStyle(
                          color: const Color(0xff0B091C), fontSize: 2.5.h)),
                ),
              ),
            ],
          ),

        ],
      )),
    );
  }
}
