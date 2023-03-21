import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safehere/features/contacts/controller/contacts_controller.dart';
import 'package:safehere/global_styles.dart';
import 'package:safehere/widgets/loader.dart';

import '../../../colors.dart';
import '../../../info.dart';

class SelectContacts extends ConsumerWidget {
  const SelectContacts({Key? key}) : super(key: key);

  void selectContact(
      WidgetRef ref, Contact selectedContact, BuildContext context) {
    ref.read(selectContactControllerProvider).selectContact(selectedContact, context);
  }

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Contacts'),
        elevation: 0,
        backgroundColor: appbarColor1,
        actions: [
          IconButton(
            onPressed:(){},
            icon: Icon(Icons.search,color: Colors.white,),
          )
        ],
      ),
      backgroundColor: bodyColor1,
      body: ref.watch(getContactsProvider).when(
          data: (contactList){
            return ListView.builder(
              itemCount: contactList.length,
              itemBuilder: (context,index){
                print(index);
                final contact=contactList[index];
                return ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                  leading: contact.photo==null?CircleAvatar(
                    radius: 20,
                    backgroundColor: primaryColor,
                  ):CircleAvatar(
                    radius: 20,
                    backgroundImage: MemoryImage(contact.photo!),
                    backgroundColor: primaryColor,),
                  title: Text(contact.displayName,style: chatTileTitle,),
                  onTap: (){selectContact(ref, contact, context);},
                  subtitle: Text(contact.phones[0].number,style: chatTileSubTitle,),
                );
              },
            );
          },
          error: (err,trace){return Loader();},
          loading: (){return Loader();})
    );
  }
}
