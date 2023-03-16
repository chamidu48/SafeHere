import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../../colors.dart';
import '../../../global_styles.dart';
import '../../../widgets/buttons.dart';


class VerifyDone extends StatefulWidget {
  const VerifyDone({Key? key}) : super(key: key);

  @override
  _VerifyDoneState createState() => _VerifyDoneState();
}

class _VerifyDoneState extends State<VerifyDone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/svg/verify.svg',color: Colors.green,height: 150),
              Text('Done',style: headingbold,),
              SizedBox(height: 15,),
              Text('Your account will be verified after we checked your documents. You can start messaging after your account has been verified. Enjoy!',
                textAlign: TextAlign.center,style: bodytextblue,),
              SizedBox(height: 40,),
              filledButton((){
                Navigator.pushNamedAndRemoveUntil(context,'/home',(route)=>false);
              }, 'Explore', primaryColor, Colors.white)
            ],
          ),
        ),
      ),
    );
  }
}
