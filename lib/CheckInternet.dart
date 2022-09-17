import 'dart:io';

import 'package:chinese_iptv/const.dart';
import 'package:flutter/material.dart';

class CheckInternet extends StatefulWidget {
  const CheckInternet({Key? key}) : super(key: key);

  @override
  State<CheckInternet> createState() => _CheckInternetState();
}

class _CheckInternetState extends State<CheckInternet> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 0), () {
      return showDialog(
          context: context,
          builder: (context) {
            return WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: SimpleDialog(
                alignment: Alignment.center,
                title: const Text("No Internet Available"),
                children: [
                  TextButton(
                      onPressed: () {
                        exit(0);
                      },
                      child: const Text("Please Re-open App"))
                ],
              ),
            );
          });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themColor,
    );
  }
}
