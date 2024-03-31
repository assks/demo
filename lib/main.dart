import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:weatherdemo/router.dart';
import 'constants/routepath_constant.dart';
import 'core/locator.dart';
import 'core/navigation_service.dart';
import 'core/provider_setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const FontFeature.localeAware(enable: true);
  setupLocator();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    BindingBase.debugZoneErrorsAreFatal = true;
    runApp(MyApp());
  }
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: providers,
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: MaterialApp(
            title: 'Demo',
            themeMode: ThemeMode.light,
            darkTheme: ThemeData(
              brightness: Brightness.dark,
            ),
            theme: ThemeData(
                useMaterial3: false,
                textTheme:
                GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
                brightness: Brightness.light,
                appBarTheme: const AppBarTheme(
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  elevation: 1,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark),
                ),
                primarySwatch: Colors.orange),
            debugShowCheckedModeBanner: false,
            navigatorKey: locator<NavigationService>().navigatorKey,
            //if (message.notification != null) {
            initialRoute: RoutePaths.Demo,
            //}
            onGenerateRoute: Routers.generateRoute,
          ),
        ),
      );
    });
  }
}
