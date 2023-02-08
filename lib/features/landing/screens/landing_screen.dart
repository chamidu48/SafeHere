import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:safehere/colors.dart';
import 'package:safehere/global_styles.dart';
import 'package:safehere/widgets/buttons.dart';
import 'package:safehere/widgets/custom_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: backgroundGradient
            ),
          ),
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0,horizontal:35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/svg/logo_small.svg'),
                    Text('SafeHere',style: heading,),
                    Text('Welcome to the world\'s most safe platform',style: subtitle,textAlign: TextAlign.center,),
                    SizedBox(height: 40,),
                    filledButton((){
                      Navigator.pushNamed(context, '/login');
                    }, 'Login', Colors.white, primaryColor),
                    SizedBox(height: 20,),
                    outlinedButton((){
                      Navigator.pushNamed(context, '/signup');
                    }, 'Sign in', Colors.white, Colors.white)
                  ],
                ),
              ),
            ),
          ),]
      )
    );
  }
}
