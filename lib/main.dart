import 'package:flutter/material.dart';
import 'package:product/view/screen/splash_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:product/helper/get_di.dart' as di;

void main() async {
  runApp(const MyApp());
  await di.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: 'Poppins',
            ),
            home: const SplashScreen());
      },
    );
  }
}
