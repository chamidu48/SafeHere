import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../colors.dart';
import '../../../global_styles.dart';
import '../../../widgets/custom_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameFieldController=TextEditingController();
  final _emailFieldController=TextEditingController();
  final _numberController=TextEditingController();
  final _ccodeController=TextEditingController();

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
                          SizedBox(height: 30,),
                          SvgPicture.asset('assets/svg/logo_small.svg'),
                          Text('Sign In',style: heading,),
                          Text('Enter your details to register',style: subtitle1,),
                          SizedBox(height: 30,),
                          buildNameField(),
                          SizedBox(height: 10,),
                          buildEmailField(),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: buildCCode(),
                              ),
                              SizedBox(width: 8,),
                              Expanded(
                                  flex: 4,
                                  child: buildNumber()
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already have an account?',style: subtitle1,),
                              TextButton(
                                onPressed: (){},
                                child: Text('Login',style: textbutton,),
                              )
                            ],
                          ),
                          SizedBox(height: 40,),
                          CustomButton(text: 'Continue', onPressed: (){print(_numberController.text);},color: Colors.white,isfilled: true,),
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
  Widget buildNameField()=>TextField(
    controller: _nameFieldController,
    keyboardType: TextInputType.text,
    textInputAction: TextInputAction.done,
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.white,width: 1)
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.white,width: 2)
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.red,width: 2)
      ),
      hintText: 'Enter your name',
      hintStyle: textfield,
      filled: true,
      fillColor: myColorScheme[400],
    ),
    textAlign: TextAlign.start,
  );

  Widget buildEmailField()=>TextField(
    controller: _emailFieldController,
    keyboardType: TextInputType.emailAddress,
    textInputAction: TextInputAction.done,
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.white,width: 1)
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.white,width: 2)
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.red,width: 2)
      ),
      hintText: 'Enter your email',
      hintStyle: textfield,
      filled: true,
      fillColor: myColorScheme[400],
    ),
    textAlign: TextAlign.start,
  );

  Widget buildNumber()=>TextField(
    controller: _numberController,
    keyboardType: TextInputType.number,
    textInputAction: TextInputAction.done,
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.white,width: 1)
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.white,width: 2)
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.red,width: 2)
      ),
      hintText: 'Enter mobile number',
      hintStyle: textfield,
      filled: true,
      fillColor: myColorScheme[400],
    ),
    textAlign: TextAlign.start,
  );

  Widget buildCCode()=>TextField(
    controller: _ccodeController,
    enabled: false,
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.white,width: 1)
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.white,width: 2)
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.red,width: 2)
      ),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.white,width: 1)
      ),
      hintText: '+94',
      hintStyle: textfield,
      filled: true,
      fillColor: myColorScheme[400],
    ),
    textAlign: TextAlign.center,
  );
}
