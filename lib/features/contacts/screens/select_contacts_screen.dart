import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safehere/features/contacts/controller/contacts_controller.dart';
import 'package:safehere/global_styles.dart';
import 'package:safehere/widgets/loader.dart';

import '../../../colors.dart';
import '../../../info.dart';

class SelectContacts extends ConsumerWidget {
  const SelectContacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Contacts'),
        elevation: 0,
        backgroundColor: appbarColor1,
      ),
      backgroundColor: bodyColor1,
      body: ref.watch(getContactsProvider).when(
          data: (contactList){
            return ListView.builder(
              itemCount: contactList.length,
              itemBuilder: (context,index){
                ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                  leading: contactList[index].photo==null?CircleAvatar(
                    radius: 20,
                    backgroundColor: primaryColor,
                  ):CircleAvatar(
                radius: 20,
                backgroundImage: MemoryImage(contactList[index].photo!),
                backgroundColor: primaryColor,),
                  title: Text(contactList[index].displayName,style: chatTileTitle,),
                  onTap: (){},
                  subtitle: Text("Send a message",style: chatTileSubTitle,),
                );
              },
            );
          },
          error: (err,trace){return Loader();},
          loading: (){return Loader();})
    );
  }
}
