import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safehere/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safehere/features/auth/repository/auth_repository.dart';

import '../../global_styles.dart';
import '../../info.dart';
import '../../models/user_model.dart';
import '../../widgets/loader.dart';
import '../auth/controller/auth_controller.dart';

class UserView extends ConsumerStatefulWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  ConsumerState <UserView> createState() => _UserViewState();
}

class _UserViewState extends ConsumerState<UserView> {
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

    final userinfo=ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    final username=userinfo['name'];
    final uid=userinfo['uid'];

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
                child: StreamBuilder<UserModel>(
                    stream: ref.read(authControllerProvider).userDataById(uid),
                  builder: (context,snapshot) {
                    if(snapshot.connectionState==ConnectionState.done){
                      return const Loader();
                    }
                    _mobilenumberController.text=snapshot.data!.phoneNumber;
                    return ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Material(
                              child: CircleAvatar(
                                foregroundColor: Colors.white,
                                backgroundImage: NetworkImage(
                                  snapshot.data!.profilePic,
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
                              username,
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
                              child: Text(snapshot.data!.bio,
                                style: textfieldfilled,maxLines: 3,overflow: TextOverflow.clip,textAlign: TextAlign.center,),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              icon:Icon(Icons.call),
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: appbarColor1,
                                  minimumSize: Size(120, 40)
                              ),
                              label: Text('Call',style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500
                              )),
                            ),
                            SizedBox(width: 20,),
                            ElevatedButton.icon(
                              icon: Icon(Icons.message),
                              onPressed: (){
                                Navigator.popAndPushNamed(
                                  context,
                                  '/chatscreen',
                                  arguments: {
                                    'name': username,
                                    'uid': uid,
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  minimumSize: Size(120, 40)
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
                              onPressed: (){
                                Navigator.pushNamed(context, '/reportscreen',arguments: {
                                  'name': username,
                                  'uid': uid,
                                });
                              },
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
                    );
                  }
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
