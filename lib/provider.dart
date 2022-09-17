import 'dart:convert';

import 'package:chinese_iptv/FirebaseDatabaseUtil.dart';
import 'package:chinese_iptv/SettingModel.dart';
import 'package:chinese_iptv/main.dart';
import 'package:http/http.dart' as http;

String settingsUrl='';

Future<Settings> fetchAlbum() async {

  await FirebaseDatabaseUtil.instance.initState();

  dynamic settingsData =
  await FirebaseDatabaseUtil.instance.readData("Settings_Data");

  if (settingsData != null) {

    settingsUrl = settingsData["chinese_url"];
    print("SettingUrl======${settingsUrl}");
  } else {
    print('else');
    settingsUrl =
    "https://raw.githubusercontent.com/pkbitcoding/iptv_channels/main/All_Country_apps/chinese/Ad_Setting.json";
  }


  final response = await http
      .get(Uri.parse(settingsUrl));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON
    return modelApi = Settings.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}



