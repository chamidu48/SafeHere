import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safehere/colors.dart';
import 'package:safehere/features/auth/controller/auth_controller.dart';
import 'package:safehere/features/chat/widgets/chat_list.dart';
import 'package:safehere/global_styles.dart';
import 'package:safehere/models/user_model.dart';
import 'package:safehere/widgets/buttons.dart';
import 'package:safehere/widgets/loader.dart';

import '../../../info.dart';
import '../widgets/bottom_chat_field.dart';

class ChatScreen extends ConsumerWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final userinfo=ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    final username=userinfo['name'];
    final uid=userinfo['uid'];

    return Scaffold(
      backgroundColor: bodyColor1,
      appBar: AppBar(
        backgroundColor: appbarColor1,
        title: InkWell(
            onTap: (){
              Navigator.pushNamed(context, '/userview');
            },
            focusColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            child: StreamBuilder<UserModel>(
              stream: ref.read(authControllerProvider).userDataById(uid),
              builder: (context,snapshot){
                if(snapshot.connectionState==ConnectionState.done){
                  return const Loader();
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: primaryColor,
                      radius: 18,
                    ),
                  SizedBox(width: 10),
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(username,style: appbartitle,),
                    Text(snapshot.data!.isOnline?'online':'offline',style: appbarStatus,)
                  ],)],
                );
              },
            )
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text(
          //       username,
          //       style: appbartitle,
          //       maxLines: 1,
          //       overflow: TextOverflow.fade,
          //     ),
          //     Text('Online',style: appbarStatus,)
          //   ],
          // ),
        ),
        centerTitle: false,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.call)),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
        ],
      ),
      body: Column(
        children: [
          Expanded(child: ChatList(recieverUserId: uid,)),
          BottomChatField(recieverUserId: uid),
        ],
      ),
    );
  }
}


