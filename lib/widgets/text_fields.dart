import 'package:flutter/material.dart';

import '../colors.dart';
import '../global_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          vertical: 0, horizontal: 20),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          color: myColorScheme[400],
          border: Border.all(
              color: Colors.white,
              width: 1
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
    );
  }
}
