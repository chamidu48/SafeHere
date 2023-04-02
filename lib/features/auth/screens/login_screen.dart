import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safehere/global_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:safehere/widgets/buttons.dart';

import 'package:country_picker/country_picker.dart';
import '../../../colors.dart';
import '../../../common/utils/utils.dart';
import '../controller/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _numberController=TextEditingController();
  final _ccodeController=TextEditingController();
  String countrycode='+1';
  Country? country;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _numberController.dispose();
    _ccodeController.dispose();
  }

  void countryPicker()=>showCountryPicker(
    context: context,
    showPhoneCode: true, // optional. Shows phone code before the country name.
    onSelect: (Country _country) {
      setState(() {
        print(_country.phoneCode);
        _ccodeController.text="+"+_country.phoneCode;
        country=_country;
      });
    },
    countryListTheme: CountryListThemeData(
      flagSize: 25,
      backgroundColor: bodyColor1,
      textStyle: textfield,
      bottomSheetHeight: 500, // Optional. Country list modal height
      //Optional. Sets the border radius for the bottomsheet.
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      //Optional. Styles the search field.
      inputDecoration: InputDecoration(
        labelText: 'Search',
        labelStyle: textfield,
        hintText: 'Start typing to search',
        hintStyle: textfield,
        prefixIcon: const Icon(Icons.search,color: Colors.white,),

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
    ),
  ));

  void sendPhoneNumber() {
    String phoneNumber = _numberController.text.trim();
    if (country != null && phoneNumber.isNotEmpty) {
      ref
          .read(authControllerProvider)
          .logInWithPhone(context, '+${country!.phoneCode}$phoneNumber');
    } else {
      showSnackBarRed(context: context, content: 'Fill out all the fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;

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
                          Text('Log In',style: heading,),
                          Text('Please enter your mobile number',style: subtitle,),
                          SizedBox(height: 40,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                    onTap:countryPicker,
                                    child: buildCCode()
                                ),
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
                              Text('Have trouble with login?',style: subtitle,),
                              TextButton(
                                onPressed: (){},
                                child: Text('Click here',style: textbutton,),
                              )
                            ],
                          ),
                          SizedBox(height: 40,),
                          filledButton(sendPhoneNumber,
                              'Login', Colors.white, primaryColor)
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
  Widget buildNumber()=>TextField(
    controller: _numberController,
    keyboardType: TextInputType.number,
    textInputAction: TextInputAction.done,
    style: textfield,
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
    keyboardType: TextInputType.number,
    textInputAction: TextInputAction.done,
    style: textfield,
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
      hintText: '+1',
      hintStyle: textfield,
      filled: true,
      fillColor: myColorScheme[400],
    ),
    enabled: false,
    textAlign: TextAlign.center,
  );
}



