
import 'package:flutter/material.dart';
import 'package:weatherdemo/UI/demoUi.dart';
import 'UI/detailpageUi.dart';
import 'constants/routepath_constant.dart';



class Routers {
  static Route<dynamic> generateRoute(settings) {
    switch (settings.name) {
      case RoutePaths.Demo:
        return MaterialPageRoute(builder: (_) =>  DemoUI());
      case RoutePaths.DetailPage:
        return MaterialPageRoute(builder: (_) =>  Detail_UI(data: settings.arguments as Map));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
