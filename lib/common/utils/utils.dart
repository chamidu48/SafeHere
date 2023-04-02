import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safehere/global_styles.dart';

void showSnackBar({
  required BuildContext context,
  required String content
}){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(content))
  );
}
void showSnackBarGreen({
  required BuildContext context,
  required String content
}){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(content,style: buttonblue,),
        backgroundColor: Colors.green,
      )
  );
}

void showSnackBarRed({
  required BuildContext context,
  required String content
}){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content,style: subtitle,),
        backgroundColor: Colors.red,
      )
  );
}

Future <File?> pickImage(BuildContext context)async{
  File? image;

  try{
    final pickedImage= await ImagePicker.platform.pickImage(source: ImageSource.gallery);

    if(pickedImage!=null){
      image = File(pickedImage.path);
    }

  }catch (e){
    showSnackBar(context: context, content: e.toString());
  }

  return image;
}