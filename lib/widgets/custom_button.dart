import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safehere/colors.dart';
import 'package:safehere/text_styles.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  bool isfilled;
  Color color;//--default color--

  CustomButton({
    required this.text,
    required this.onPressed,
    required this.isfilled,
    required this.color,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isfilled?ElevatedButton(
      onPressed: onPressed,
      child: Text(text,style: buttonwhite,),
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 60),
          elevation: 0,
          primary: color,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15))
      ),

    )
        : OutlinedButton(
            onPressed: onPressed,
            child: Text('Log In'),
            style: OutlinedButton.styleFrom(
                primary: Colors.white,
                side: BorderSide(width: 1.5, color: Colors.white),
                elevation: 0,
                textStyle: buttonblue,
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
          );
  }
}
