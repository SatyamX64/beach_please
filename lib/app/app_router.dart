import 'package:beach_please/presentation/common_ui/scale_route.dart';
import 'package:beach_please/presentation/screens/home/sc_home.dart';
import 'package:beach_please/presentation/screens/splash/sc_splash.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const SPLASH = '/splash';
  static const HOME = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouter.SPLASH:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case AppRouter.HOME:
        return SlideNavigation(widget: HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
