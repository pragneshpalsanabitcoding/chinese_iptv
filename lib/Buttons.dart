
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget blueGreenUnderstood(String title) {
  return Container(
    width: 8.w,
    height: 5.5.h,
    // margin: EdgeInsets.all(10),
    margin: EdgeInsets.only(left: 10.w, right: 10.w
        , bottom: 1.h, top: 1.h
    ),
    // padding: EdgeInsets.all(1.5.h),
    alignment: Alignment.center,
    decoration: const BoxDecoration(
        color: Color(0xff36B149),
        borderRadius: BorderRadius.all(Radius.circular(14))),
    child: Center(
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget buttonRed(String title) {
  return Container(
    width: 70.w,
    height: 6.h,
    margin: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 2.h, top: 2.h),
    // padding: EdgeInsets.all(1.5.h),
    alignment: Alignment.center,
    decoration: const BoxDecoration(
        color: Color(0xffE20000),
        borderRadius: BorderRadius.all(Radius.circular(14))),
    child: Center(
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white, fontSize: 5.w, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
Widget buttonsGrey(String title) {
  return Container(
    width: 70.w,
    height: 6.h,
    margin: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 2.h, top: 2.h),
    // padding: EdgeInsets.all(1.5.h),
    alignment: Alignment.center,
    decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(14))),
    child: Center(
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white, fontSize: 5.w, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget yellowWhite(String title) {
  return Container(
    width: 70.w,
    height: 6.h,
    margin: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 2.h),
    alignment: Alignment.center,
    decoration: const BoxDecoration(
        color: Color(0xff000000),
        borderRadius: BorderRadius.all(Radius.circular(14))),
    child: Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(title,
            textAlign: TextAlign.center,

            style: TextStyle(
                color: Colors.white,
                fontSize: 4.5.w,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: 1.5.w,),
        const Text("(Ad)",style: TextStyle(color: Colors.white),)
      ],
    ),
  );
}


Widget buttonGrey(String title) {
  return Container(
    width: 70.w,
    height: 6.h,
    margin: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 2.h),
    // padding: EdgeInsets.all(1.5.h),
    alignment: Alignment.center,
    decoration: const BoxDecoration(
        color: Color(0xff515151),
        borderRadius: BorderRadius.all(Radius.circular(14))),
    child: Center(
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white, fontSize: 5.w, fontWeight: FontWeight.bold),
      ),
    ),
  );
}