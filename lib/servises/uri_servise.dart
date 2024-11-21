// ignore_for_file: curly_braces_in_flow_control_structures, dead_code_on_catch_subtype

import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:deep_links/green_scr.dart';
import 'package:deep_links/redscr.dart';
import 'package:deep_links/servises/context_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_links2/uni_links.dart';
import 'dart:developer' as developer;

class UniService {
  static String _code = "";
  static String get code => _code;
  static bool get hasCode => _code.isNotEmpty;

  static void reset() => _code = "";

  static init() async {
    try {
      final Uri? uri = await getInitialUri();
      uniHandler(uri);
    } on PlatformException {
      log("Failed to receive the code from the server");
    } on FormatException {
      log("Wrong format code recieved");
    } on FormatException {
      developer.log('Failed to receive the code from the server');
    }

    uriLinkStream.listen((Uri? uri) {
      // Notice the corrected usage of the listen function
      uniHandler(uri);
    });
  }

  static uniHandler(Uri? uri) {
    if (uri == null || uri.queryParameters.isEmpty) {
      Map<String, String> param = uri!.queryParameters;
      String receiveCode = param['code'] ?? '';

      if (receiveCode == 'green') {
        Navigator.push(
          ContextUtility.context!,
          MaterialPageRoute(
            builder: (_) => GreenScr(),
          ),
        );
      } else
        (Navigator.push(
          ContextUtility.context!,
          MaterialPageRoute(
            builder: (_) => RedScreen(),
          ),
        ));
    }
  }
}
