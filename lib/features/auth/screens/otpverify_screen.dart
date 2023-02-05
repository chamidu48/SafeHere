import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../colors.dart';
import '../../../global_styles.dart';
import '../../../widgets/custom_button.dart';
 class OTPscreen extends StatefulWidget {
   const OTPscreen({Key? key}) : super(key: key);

   @override
   _OTPscreenState createState() => _OTPscreenState();
 }

 class _OTPscreenState extends State<OTPscreen> {
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
             child: SingleChildScrollView(
               child: Padding(
                 padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Row(
                       children: [
                         IconButton(
                             onPressed: (){},
                             color: Colors.white,
                             icon: Icon(Icons.arrow_back_ios)
                         )
                       ],
                     ),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           SizedBox(height: 80,),
                           SvgPicture.asset('assets/svg/logo_small.svg'),
                           Text('Verify number',style: heading,),
                           Text('Please enter the 6 digit code you recieve',style: subtitle1,),
                           SizedBox(height: 40,),
                           SizedBox(height: 40,),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text('Didn\'t receive code?',style: subtitle1,),
                               TextButton(
                                 onPressed: (){},
                                 child: Text('Resend',style: textbutton,),
                               )
                             ],
                           ),
                           SizedBox(height: 40,),
                           CustomButton(text: 'Verify', onPressed: (){},color: Colors.white,isfilled: true,),
                         ],
                       ),
                     )
                   ],
                 ),
               ),
             ),
           )
         ],
       ),
     );
   }
 }
