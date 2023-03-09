import 'package:flutter/material.dart';
import 'package:safehere/colors.dart';
import 'package:safehere/global_styles.dart';
import 'package:safehere/widgets/buttons.dart';

import 'package:flutter_svg/flutter_svg.dart';

class Verify extends StatelessWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appbarColor,
        title: Text('Verify',style: appbartext,),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/svg/face_id.svg',color: primaryColor,height: 150),
              SizedBox(height: 45,),
              Text('We need to verify you',style: headingbold,),
              SizedBox(height: 15,),
              Text('BISUHNiuhniuhnnde cmje9n9 emc9c. huhcniwcnoncuchnch ch c c ce chuedhid,e8ed jeh8djd9j 9ej9djed 9woqod hcu dcbubu. jcuhec8hje9cc .hcc9 cec.',
              textAlign: TextAlign.center,style: bodytextblue,),
              SizedBox(height: 40,),
              filledButton((){
                Navigator.pushNamed(context, '/selectdocument');
              }, 'Continue', primaryColor, Colors.white)
            ],
          ),
        ),
      ),
    );
  }
}
