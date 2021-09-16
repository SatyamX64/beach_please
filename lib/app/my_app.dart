import 'package:beach_please/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import '/app/app_config.dart';
import '/app/app_router.dart';
import 'package:sizer/sizer.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appConfig = AppConfig.of(context);
    return MaterialApp(
      title: appConfig.name,
      initialRoute: appConfig.initialRoute,
      onGenerateRoute: AppRouter.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: COLOR_CONST.BG,
      ),
    );
  }

  static Future<void> initGlobalConfigs() async {}

  static Widget run() {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return const MyApp();
      },
    );
  }
}
