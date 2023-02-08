import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safehere/colors.dart';
import 'package:safehere/global_styles.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomButton extends StatelessWidget {
  String text='';
  VoidCallback onPressed=(){};
  bool isfilled=true;
  Color color=primaryColor;
  Color textColor=Colors.white;
  Color borderColor=Colors.white;//--default color--

  CustomButton(String text,VoidCallback onPressed,bool isfilled,Color? color,Color? textColor,Color? borderColor){
    this.text=text;
    this.onPressed=onPressed;
    this.isfilled=isfilled;
    this.color=color!;
    this.textColor=textColor!;
    this.borderColor=borderColor!;
  }


  @override
  Widget build(BuildContext context) {
    return isfilled?ElevatedButton(
      onPressed: onPressed,
      child: Text(text,style: GoogleFonts.poppins(
          color: textColor,
          fontSize: 15,
          fontWeight: FontWeight.w500
      )),
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
            child: Text(text),
            style: OutlinedButton.styleFrom(
                primary: Colors.white,
                side: BorderSide(width: 1.5, color: Colors.white),
                elevation: 0,
                textStyle: GoogleFonts.poppins(
                    color: textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                ),
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
          );
  }
}
