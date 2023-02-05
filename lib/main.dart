import 'package:flutter/material.dart';
import 'package:safehere/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safehere/features/auth/screens/login_screen.dart';
import 'package:safehere/features/auth/screens/otpverify_screen.dart';
import 'package:safehere/features/landing/screens/landing_screen.dart';
import 'package:safehere/widgets/custom_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'features/auth/screens/signup_screen.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: myColorScheme,
        scaffoldBackgroundColor: myColorScheme[700],
        accentColor: myColorScheme[400],
      ),
      //home: SplashScreen()
      home: OTPscreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: backgroundGradient
                ),),
              Center(
                child: Container(
                  child: SvgPicture.asset('assets/svg/logo.svg'),
                ),
              )
            ]
        ),
        )
    );
  }
}


