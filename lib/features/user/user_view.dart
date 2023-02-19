import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safehere/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../global_styles.dart';
import '../../info.dart';

class UserView extends StatefulWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  final _nameFieldController=TextEditingController();
  final _mobilenumberController=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameFieldController.text='date_joined';
    _mobilenumberController.text='current_mobile_number';
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameFieldController.dispose();
    _mobilenumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final size=MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: appbarColor1,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: appbarColor1,
      ),
      body: SafeArea(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 80),
                decoration: BoxDecoration(
                    color: bodyColor1
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 10),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Material(
                          child: CircleAvatar(
                            foregroundColor: Colors.white,
                            backgroundImage: NetworkImage(
                              info[0]['profilePic'].toString(),
                            ),
                            radius: 70,
                          ),
                          shape: CircleBorder(
                              side: BorderSide(color: Colors.white, width: 4)),
                          color: Colors.white,
                          clipBehavior: Clip.hardEdge,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Text(
                          info[0]['name'].toString(),
                          style: userHeading,
                          textAlign: TextAlign.center,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Verified',
                          style: verified,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.verified,
                          color: Colors.green,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text('Nojwofwh rfrf. Nivrvo vwhvwojviwof vhjojwvovwfov whhwvwov whohv vhvow',
                            style: textfieldfilled,maxLines: 3,overflow: TextOverflow.clip,textAlign: TextAlign.center,),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                          icon:Icon(Icons.call),
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: appbarColor1,
                              minimumSize: Size(150, 40)
                          ),
                          label: Text('Call',style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500
                          )),
                        ),
                        ElevatedButton.icon(
                          icon: Icon(Icons.message),
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              minimumSize: Size(150, 40)
                          ),
                          label: Text('Message',style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500
                          ))
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Mobile number',
                      style: subtitlebold,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    buildMobileField(),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Joined',
                      style: subtitlebold,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    buildNameField(),
                    SizedBox(height: 40,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          icon:Icon(Icons.block),
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: appbarColor1,
                              minimumSize: Size(double.infinity, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))
                          ),
                          label: Text('Block',style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500
                          )),
                        ),
                        SizedBox(height: 5,),
                        ElevatedButton.icon(
                          icon:Icon(Icons.report_gmailerrorred_outlined),
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              minimumSize: Size(double.infinity, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))
                          ),
                          label: Text('Report',style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500
                          )),
                        ),
                      ],
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
    ),
    textAlign: TextAlign.start,
    enabled: false,
  );
  Widget buildMobileField()=>TextField(
    controller: _mobilenumberController,
    keyboardType: TextInputType.text,
    textInputAction: TextInputAction.done,
    style: textfieldfilled,
    enabled: false,
    decoration: InputDecoration(
      filled: true,
      fillColor: appbarColor1,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
    ),
    textAlign: TextAlign.start,
  );
}
