import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../colors.dart';
import '../../../text_styles.dart';
import '../../../widgets/custom_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 80,),
                          SvgPicture.asset('assets/svg/logo_small.svg'),
                          Text('Log In',style: heading,),
                          Text('Please enter your mobile number',style: subtitle1,),
                          SizedBox(height: 40,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 20),
                                height: 60,
                                width: 70,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: myColorScheme[400],
                                    border: Border.all(
                                        color: primaryColor,
                                        width: 2
                                    ),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: InputDecoration(
                                      fillColor: Colors.transparent,
                                      label: Text('+1'),
                                      labelStyle: textfield,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                      floatingLabelAlignment:
                                      FloatingLabelAlignment.center,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8,),
                              Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 20),
                                    height: 60,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: myColorScheme[400],
                                        border: Border.all(
                                            color: primaryColor,
                                            width: 2
                                        ),
                                        borderRadius: BorderRadius.circular(15)),
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: InputDecoration(
                                        fillColor: Colors.transparent,
                                        label: Text('Enter mobile number'),
                                        labelStyle: textfield,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        floatingLabelAlignment:
                                        FloatingLabelAlignment.center,
                                      ),
                                    ),
                                  )
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Have trouble with login?',style: subtitle1,),
                              TextButton(
                                onPressed: (){},
                                child: Text('Click here',style: textbutton,),
                              )
                            ],
                          ),
                          SizedBox(height: 40,),
                          CustomButton(text: 'Login', onPressed: (){},color: Colors.white,isfilled: true,),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
