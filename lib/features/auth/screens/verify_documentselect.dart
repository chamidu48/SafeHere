
import 'package:flutter/material.dart';

import '../../../colors.dart';
import '../../../global_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DocumentSelect extends StatelessWidget {
  const DocumentSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appbarColor,
        title: Text('Verify',style: appbartext,),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/svg/verify.svg',color: primaryColor,height: 150),
              SizedBox(height: 15,),
              Text('Select a documemt to verify',style: headingbold,),
              SizedBox(height: 15,),
              Text('BISUHNiuhniuhnnd. Chid,e8ed jeh8djd9j 9ej9djed 9woqod hcu dcbubu. jcuhec8hje9cc .hcc9 cec.',
                textAlign: TextAlign.center,style: bodytextblue,),
              SizedBox(height: 20,),
              CustomIconButton(text: 'Passport',icon: Icons.language,onPressed: (){Navigator.pushNamed(context, '/verifystepper');},),
              SizedBox(height: 5,),
              CustomIconButton(text: 'Driver License',icon: Icons.directions_car_sharp,onPressed: (){Navigator.pushNamed(context, '/verifystepper');},),
              SizedBox(height: 5,),
              CustomIconButton(text: 'National ID',icon: Icons.credit_card,onPressed: (){Navigator.pushNamed(context, '/verifystepper');},),
              SizedBox(height: 40,)
            ],
          ),
        ),
      ),
    );;
  }
}

class CustomIconButton extends StatelessWidget {
  String? text;
  IconData icon;
  VoidCallback onPressed;

  CustomIconButton({
    required this.text,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        fixedSize: Size(200,50),
        elevation: 0.5
      ),
      label: Text(text!,style: buttonwhitebold),
      onPressed: onPressed,
      icon: Icon(icon!,color: primaryColor,),
        );
  }
}
