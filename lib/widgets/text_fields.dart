import 'dart:ffi';

import 'package:flutter/material.dart';

import '../colors.dart';
import '../text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  double width=double.infinity;
  bool numberPad=false;

  CustomTextField({required this.label,double?width,bool?numberPad,Key? key}){
    if(width!=null){this.width=width;};
    if(numberPad!=null){this.numberPad=numberPad;}
  }
  @override
  Widget build(BuildContext context) {
    return numberPad?Container(
      padding: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
      height: 60,
      width: width,
      decoration: BoxDecoration(
          color: myColorScheme[400],
          borderRadius: BorderRadius.circular(15)
      ),
      child: TextField(
        textAlign: TextAlign.center,
        clipBehavior: Clip.antiAlias,
        maxLength: 3,
        decoration: InputDecoration(
          fillColor: Colors.transparent,
          label: Text(label),
          labelStyle: textfield,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          floatingLabelAlignment: FloatingLabelAlignment.center,
        ),
      ),
    )
        : Container(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            height: 60,
            width: width,
            decoration: BoxDecoration(
                color: myColorScheme[400],
                borderRadius: BorderRadius.circular(15)),
            child: TextField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              clipBehavior: Clip.antiAlias,
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                label: Text(label),
                labelStyle: textfield,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                floatingLabelAlignment: FloatingLabelAlignment.center,
              ),
            ),
          );
  }
}
