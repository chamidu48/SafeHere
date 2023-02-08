import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:safehere/global_styles.dart';
import 'package:safehere/widgets/buttons.dart';
import 'package:safehere/widgets/custom_button.dart';

import '../../../colors.dart';

class UserInfoSelectScreen extends StatefulWidget {
  const UserInfoSelectScreen({Key? key}) : super(key: key);

  @override
  _UserInfoSelectScreenState createState() => _UserInfoSelectScreenState();
}

class _UserInfoSelectScreenState extends State<UserInfoSelectScreen> {

  final _nameFieldController=TextEditingController();
  final _bioFieldController=TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameFieldController.dispose();
    _bioFieldController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final size=MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: appbarColor,
      appBar: AppBar(
        elevation: 0,
        title: Text('Fill your details',style: appbartext,),
        centerTitle: true,
        backgroundColor: appbarColor,
        automaticallyImplyLeading: false,
        actions: [
          TextButton(onPressed: (){
            Navigator.of(context).popAndPushNamed('/home');
          }, child: Text('Skip',style: textbuttonlight,))
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 120),
              decoration: BoxDecoration(
                color: Colors.white
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(
                        child: CircleAvatar(
                          foregroundColor: Colors.white,
                          backgroundColor: myColorScheme[400],
                          child: Text('Chnage Photo'),
                          minRadius: 65,
                          maxRadius: 65,
                        ),
                        shape: CircleBorder(
                          side: BorderSide(color: Colors.white,width: 4)
                        ),
                        color: Colors.white,
                        clipBehavior: Clip.hardEdge,
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Text('Username',style: subtitlebold,),
                  SizedBox(height: 10,),
                  buildNameField(),
                  SizedBox(height: 30,),
                  Text('Bio',style: subtitlebold,),
                  SizedBox(height: 10,),
                  buildbioField(),
                ],
              ),
            )
          ],
        )
    ),
    );
  }
  Widget buildNameField()=>TextField(
    controller: _nameFieldController,
    keyboardType: TextInputType.text,
    textInputAction: TextInputAction.done,
    decoration: InputDecoration(
      filled: true,
      fillColor: myColorScheme[50],
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      hintText: 'Choose a username',
      hintStyle: textfieldfilled,
      suffixIcon: InkWell(
          onTap: (){},
          child: Icon(Icons.edit,color: primaryColor,size: 18,)
      ),
      ),
    textAlign: TextAlign.start,
  );
  Widget buildbioField()=>TextField(
    controller: _bioFieldController,
    keyboardType: TextInputType.text,
    textInputAction: TextInputAction.done,
    minLines: 2,
    maxLines: 2,
    decoration: InputDecoration(
      filled: true,
      fillColor: myColorScheme[50],
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      hintText: 'Choose a bio',
      hintStyle: textfieldfilled,
      suffixIcon: InkWell(
          onTap: (){},
          child: Icon(Icons.edit,color: primaryColor,size: 18,)
      ),
    ),
    textAlign: TextAlign.start,
  );
}
