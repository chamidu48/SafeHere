import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:safehere/common/utils/utils.dart';
import 'package:safehere/widgets/buttons.dart';

import '../../../colors.dart';
import '../../../global_styles.dart';
import '../controller/auth_controller.dart';


 class OTPscreen extends ConsumerWidget {

   String verificationId='';

   OTPscreen({Key? key}) : super(key: key);

   final _pinCodeController=TextEditingController();

   @override
  void dispose() {
    _pinCodeController.dispose();
  }

   void verifyOTP(WidgetRef ref, BuildContext context, String userOTP,) {
     ref.read(authControllerProvider).verifyOTP(
       context,
       verificationId,
       userOTP,
       false
     );
   }


   @override
   Widget build(BuildContext context,WidgetRef ref) {

     verificationId=ModalRoute.of(context)!.settings.arguments as String;

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
                             onPressed: (){
                               Navigator.popAndPushNamed(context, '/landing');
                             },
                             color: Colors.white,
                             icon: Icon(Icons.arrow_back_ios)
                         )
                       ],
                     ),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 0),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           SizedBox(height: 80,),
                           SvgPicture.asset('assets/svg/logo_small.svg'),
                           Text('Verify number',style: heading,),
                           Text('Please enter the 6 digit code you recieve',style: subtitle,),
                           SizedBox(height: 40,),
                           PinCodeTextField(
                             controller: _pinCodeController,
                             keyboardType: TextInputType.number,
                             defaultBorderColor: Colors.white,
                             maxLength: 6,
                             errorBorderColor: Colors.red,
                             autofocus: false,
                             hasUnderline: false,
                             onDone: (pin){
                               verifyOTP(ref, context, pin);
                             },
                             pinTextStyle: textfield,
                             pinBoxWidth: 35,
                             hasTextBorderColor: Colors.white,
                             pinBoxRadius: 8,
                             pinBoxBorderWidth: 1,
                             pinBoxColor: Colors.white.withOpacity(0.2),
                             pinBoxHeight: 60,
                           ),
                           SizedBox(height: 30,),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text('Didn\'t receive code?',style: subtitle,),
                               TextButton(
                                 onPressed: (){},
                                 child: Text('Resend',style: textbutton,),
                               )
                             ],
                           ),
                           SizedBox(height: 30,),
                           filledButton((){
                           showSnackBar(context: context, content: 'Please enter the code first');
                           }, 'Verify', Colors.white, primaryColor)
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
