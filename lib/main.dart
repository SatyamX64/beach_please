import 'package:flutter/material.dart';

import 'app/app_config.dart';
import 'app/app_router.dart';
import 'app/my_app.dart';

Future<void> main() async {
  await MyApp.initGlobalConfigs();
  runApp(
    AppConfig(
      name: 'Beach Please',
      initialRoute: AppRouter.SPLASH,
      flavour: Flavour.developement,
      child: MyApp.run(),
    ),
  );
}


// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:lottie/lottie.dart';

// import 'flipping_switch.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
//       .then((_) {
//     runApp(new MyApp());
//   });
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyHome(),
//     );
//   }
// }

// class MyWidzet extends StatelessWidget {
//   const MyWidzet({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.blue,
//         body: Column(
//           children: [
//             Expanded(
//               flex: 2,
//               child: Container(
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Lottie.network(
//                           'https://assets10.lottiefiles.com/packages/lf20_F2C05u.json'),
//                     ),
//                     Expanded(
//                       child: Container(),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 5,
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Container(),
//                   ),
//                   Expanded(
//                     flex: 5,
//                     child: Stack(
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.only(top: 24),
//                           child: PhysicalModel(
//                             color: Colors.white,
//                             borderRadius:
//                                 BorderRadius.only(topLeft: Radius.circular(24)),
//                             elevation: 16,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.blue,
//                                   borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(18),
//                                   ),
//                                   boxShadow: [
//                                     BoxShadow(color: Colors.white30),
//                                   ]),
//                               margin: EdgeInsets.only(top: 6, left: 6),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 24.0),
//                           child: Align(
//                             alignment: Alignment.topCenter,
//                             child: FlippingSwitch(
//                               color: Colors.white,
//                               background: Colors.blue,
//                               leftLabel: "Left",
//                               rightLabel: "Right",
//                               onChange: (_) {},
//                               tabWidth: 240,
//                               tabHeight: 48,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
