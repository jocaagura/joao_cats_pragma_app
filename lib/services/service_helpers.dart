
import 'dart:convert';
import 'dart:math';

import 'package:url_launcher/url_launcher.dart';

class ServiceHelpers{


  /// [validateUrl] checks if the url has a correct format

  static bool validateUrl(String url) {
    if (url.isEmpty) {
      return false;
    }
    Pattern pattern = r'^https?:\/\/[\w\-]+(\.[\w\-]+)+[/#?]?.*$';
    return RegExp(pattern as String).hasMatch(url);
  }
  /// url launcher
  static launchUrlPage(String url, {Map<String, String> headers = const {}}){
    if(validateUrl(url)){
      launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        headers: headers,
      );
    }
  }

  //random string
  static String getRandString(int len) {
    var random = Random.secure();
    var values = List<int>.generate(len, (i) =>  random.nextInt(255));
    return base64UrlEncode(values);
  }


}