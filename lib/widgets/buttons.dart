import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ElevatedButton filledButton(VoidCallback onPressed,String text,Color color,Color textColor)=>ElevatedButton(
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
          borderRadius: BorderRadius.circular(10))
  ),
);
OutlinedButton outlinedButton(VoidCallback onPressed,String text,Color borderColor,Color textColor)=>OutlinedButton(
  onPressed: onPressed,
  child: Text(text),
  style: OutlinedButton.styleFrom(
      primary: borderColor,
      side: BorderSide(width: 1.5, color: borderColor),
      elevation: 0,
      textStyle: GoogleFonts.poppins(
          color: textColor,
          fontSize: 15,
          fontWeight: FontWeight.w500
      ),
      minimumSize: Size(double.infinity, 60),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10))),
);