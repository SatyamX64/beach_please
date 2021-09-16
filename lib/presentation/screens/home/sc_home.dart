import 'package:beach_please/presentation/common_widgets/flipping_switch.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Lottie.network(
                          'https://assets10.lottiefiles.com/packages/lf20_F2C05u.json'),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Row(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  Expanded(
                    flex: 5,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 24),
                          child: PhysicalModel(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(24)),
                            elevation: 16,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(18),
                                  ),
                                  boxShadow: [
                                    BoxShadow(color: Colors.white30),
                                  ]),
                              margin: EdgeInsets.only(top: 6, left: 6),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: FlippingSwitch(
                              color: Colors.white,
                              background: Colors.blue,
                              leftLabel: "Left",
                              rightLabel: "Right",
                              onChange: (_) {},
                              tabWidth: 240,
                              tabHeight: 48,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
