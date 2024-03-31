import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';



class Helper {
  static Future<bool> checkConnectivity() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result.first.rawAddress.isNotEmpty) {
        Helper.printLogValue('connected');
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      Helper.printLogValue('not connected');
      return false;
    }
  }

  static printLogValue(dynamic value) {}

  static showNoConnectivityDialog(BuildContext buildContext) {
    Alert(
      context: buildContext,
      type: AlertType.error,
      title: "You are disconnected to the Internet. Please check your internet connection",
      buttons: [
        DialogButton(
          onPressed: () {
            exit(0);
          },
          color: Colors.black,
          child: const Text("Close",
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
      ],
    ).show();
  }
}




