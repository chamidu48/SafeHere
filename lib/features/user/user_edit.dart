import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../global_styles.dart';
import '../../info.dart';

class UserEdit extends StatefulWidget {
  const UserEdit({Key? key}) : super(key: key);

  @override
  _UserEditState createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit> {
  final _nameFieldController=TextEditingController();
  final _bioFieldController=TextEditingController();
  final _mobilenumberController=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameFieldController.text='current_username';
    _bioFieldController.text='current_bio';
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameFieldController.dispose();
    _bioFieldController.dispose();
    _mobilenumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final size=MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: appbarColor1,
      appBar: AppBar(
        elevation: 0,
        title: Text('Edit your details',style: appbartext,),
        centerTitle: true,
        backgroundColor: appbarColor1,
        actions: [
          TextButton(onPressed: (){
            Navigator.of(context).popAndPushNamed('/home');
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
                        Material(
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              info[0]['profilePic'].toString(),
                            ),
                            child: Text('Chnage Photo',style: subtitlebold,),
                            radius: 70,
                          ),
                          shape: CircleBorder(
                              side: BorderSide(color: Colors.white,width: 4)
                          ),
                          color: Colors.white,
                          clipBehavior: Clip.hardEdge,
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
                        SizedBox(height: 30,),
                        Text('Mobile number',style: subtitlebold,),
                        SizedBox(height: 10,),
                        buildMobileField(),]
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
    style: textfieldfilled,
    textInputAction: TextInputAction.done,
    decoration: InputDecoration(
      filled: true,
      fillColor: appbarColor1,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      hintText: 'Choose a username',
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
    style: textfieldfilled,
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
  Widget buildMobileField()=>TextField(
    controller: _mobilenumberController,
    keyboardType: TextInputType.text,
    textInputAction: TextInputAction.done,
    style: textfield,
    enabled: false,
    decoration: InputDecoration(
      filled: true,
      fillColor: appbarColor1,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      hintText: '+94785182748',
      hintStyle: textfieldfilled,
    ),
    textAlign: TextAlign.start,
  );
}
