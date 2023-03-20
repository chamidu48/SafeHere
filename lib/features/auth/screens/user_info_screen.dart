import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safehere/common/utils/utils.dart';
import 'package:safehere/global_styles.dart';
import '../../../colors.dart';
import '../controller/auth_controller.dart';

class UserInfoSelectScreen extends ConsumerStatefulWidget {
  const UserInfoSelectScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<UserInfoSelectScreen> createState() => _UserInfoSelectScreenState();
}

class _UserInfoSelectScreenState extends ConsumerState<UserInfoSelectScreen> {

  final _nameFieldController=TextEditingController();
  final _bioFieldController=TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameFieldController.dispose();
    _bioFieldController.dispose();
  }

  File? image;

  void selectImage() async{
    image = await pickImage(context);
    setState(() {});
    print(image?.path);
  }

  void storeUserData() async {
    String name = _nameFieldController.text.trim();
    String bio = _bioFieldController.text.trim();

    if (name.isNotEmpty) {
      ref.read(authControllerProvider).saveUserDataToFirebase(
        context,
        name,
        image,
        bio
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    final size=MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: appbarColor1,
      appBar: AppBar(
        elevation: 0,
        title: Text('Fill your details',style: appbartext,),
        centerTitle: true,
        backgroundColor: appbarColor1,
        automaticallyImplyLeading: false,
        actions: [
          TextButton(onPressed: (){
            storeUserData();
          }, child: Text('Save',style: textbuttonlight,))
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 120),
              decoration: BoxDecoration(
                color: bodyColor1
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Material(
                            child: image==null?
                                    CircleAvatar(
                                    foregroundColor: Colors.white,
                                    backgroundColor: myColorScheme[400],
                                    radius: 70,
                                    )
                            : CircleAvatar(
                                backgroundImage: FileImage(image!),radius: 70,),
                                shape: CircleBorder(
                                side: BorderSide(color: primaryColor,width: 4)
                            ),
                            color: Colors.white,
                            clipBehavior: Clip.hardEdge,
                          ),
                          Positioned(
                            bottom: -3,
                              right: 0,
                              child: IconButton(onPressed: (){selectImage();}, icon: Icon(Icons.add_a_photo,color: Colors.white,)))
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView(
                      children: [
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
    style: textfield,
    decoration: InputDecoration(
      filled: true,
      fillColor: appbarColor1,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      hintText: 'Enter name',
      hintStyle: textfieldfilled,
      suffixIcon: InkWell(
          onTap: (){},
          child: Icon(Icons.edit,color: Colors.white,size: 18,)
      ),
      ),
    textAlign: TextAlign.start,
  );
  Widget buildbioField()=>TextField(
    controller: _bioFieldController,
    keyboardType: TextInputType.text,
    textInputAction: TextInputAction.done,
    style: textfield,
    minLines: 2,
    maxLines: 2,
    decoration: InputDecoration(
      filled: true,
      fillColor: appbarColor1,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      hintText: 'Choose a bio',
      hintStyle: textfieldfilled,
      suffixIcon: InkWell(
          onTap: (){},
          child: Icon(Icons.edit,color: Colors.white,size: 18,)
      ),
    ),
    textAlign: TextAlign.start,
  );
}
