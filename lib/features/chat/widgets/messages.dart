import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:safehere/colors.dart';
import 'package:safehere/common/utils/utils.dart';
import 'package:safehere/features/auth/controller/auth_controller.dart';
import 'package:safehere/features/auth/repository/auth_repository.dart';
import 'package:safehere/features/chat/controller/chat_controller.dart';
import 'package:safehere/features/encyption/encrypt_service.dart';
import 'package:safehere/info.dart';
import 'package:safehere/models/chat_contact.dart';
import 'package:safehere/models/user_model.dart';

import '../../../global_styles.dart';
import '../../../widgets/loader.dart';

class Messenger extends ConsumerWidget {
  const Messenger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final EncryptionService encryptionService=EncryptionService();

    return Scaffold(
      appBar: AppBar(
        title: Text('Messages',style: appbartitle,),
        automaticallyImplyLeading: false,
        backgroundColor: appbarColor1,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.more_vert),
          )
        ],
      ),
      backgroundColor: bodyColor1,
      body: StreamBuilder<List<ChatContact>>(
        stream: ref.read(chatControllerProvider).chatContacts(),
        builder: (context,snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext,index){
              var chatContactData=snapshot.data![index];
              return ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                title: Text(chatContactData.name,style: chatTileTitle),
                subtitle: Text(encryptionService.decrypt(chatContactData.lastMessage),style: chatTileSubTitle,maxLines: 1,),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Text(DateFormat.Hm().format(chatContactData.timeSent),style: chatTileTime,),
                    Text('delivered',style: chatTileTime,)
                  ]
                ),
                leading: CircleAvatar(
                  backgroundColor: chatcardSelectedColor,
                  backgroundImage: NetworkImage(
                    chatContactData.profilePic
                  ),
                  radius: 30,
                ),
                tileColor: info[index]['seen']==true?chatcardSelectedColor:bodyColor1,
                onTap: (){
                  Navigator.pushNamed(context, '/chatscreen',arguments: {
                    "name":chatContactData.name,
                    "uid":chatContactData.contactId,
                  });
                },
                onLongPress: (){},
                splashColor: chatcardSelectedColor,
                focusColor: chatcardSelectedColor,
              );}
          );
        }
      ),
      floatingActionButton: buildFloatingButton(context),
    );
  }
  Widget buildFloatingButton(BuildContext context){
    return FloatingActionButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(Icons.edit),
      elevation: 0,
      splashColor: chatcardSelectedColor,
      onPressed: (){
        Navigator.pushNamed(context, '/selectcontacts');
      },
    );
  }
}
