import 'package:beach_please/app/app_router.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onVerticalDragUpdate: (dragUpdateDetails) {
            Navigator.of(context).pushNamed(AppRouter.HOME);
          },
          child: Stack(
            children: [
              Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blue.shade200, Colors.white],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 0.4]),
                ),
              ),
              Positioned(
                bottom: 0,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Lottie.network(
                      'https://assets1.lottiefiles.com/packages/lf20_hhpngmih.json'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
