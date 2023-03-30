import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:safehere/features/chat/controller/chat_controller.dart';
import 'package:safehere/features/chat/widgets/sender_message_card.dart';
import 'package:safehere/features/chat/widgets/messages.dart';
import 'package:safehere/models/message.dart';

import '../../../info.dart';
import '../../../widgets/loader.dart';
import 'my_message_card.dart';

class ChatList extends ConsumerStatefulWidget {
  final String recieverUserId;
  ChatList({
    Key? key,
    required this.recieverUserId
  }) : super(key: key);

  @override
  ConsumerState<ChatList> createState() => _ChatListState();
}

class _ChatListState extends ConsumerState<ChatList> {
  final ScrollController messageController=ScrollController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Message>>(
        stream: ref.read(chatControllerProvider).chatStream(widget.recieverUserId),
        builder: (context,snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          }
          SchedulerBinding.instance.addPostFrameCallback((_) {
            messageController.jumpTo(messageController.position.maxScrollExtent);
          });
          return ListView.builder(
            controller: messageController,
            itemCount: snapshot.data?.length,
            itemBuilder: (context,index){
              final messageData=snapshot.data![index];
              return messageData.senderId==FirebaseAuth.instance.currentUser!.uid?
              MyMessageCard(
                message: messageData.text,
                date: DateFormat.Hm().format(messageData.timeSent),
              )
                  : SendermessageCard(
                message: messageData.text,
                date: DateFormat.Hm().format(messageData.timeSent),
              );
            },
          );
        }
    );
  }
}


// class ChatList extends ConsumerWidget {
//   final String recieverUserId;
//   ChatList({
//     Key? key,
//     required this.recieverUserId
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context,WidgetRef ref) {
//     return StreamBuilder<List<Message>>(
//       stream: ref.read(chatControllerProvider).chatStream(recieverUserId),
//       builder: (context,snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Loader();
//         }
//         return ListView.builder(
//           itemCount: snapshot.data?.length,
//           itemBuilder: (context,index){
//             final messageData=snapshot.data![index];
//             return messageData.senderId==FirebaseAuth.instance.currentUser!.uid?
//             MyMessageCard(
//               message: messageData.text,
//               date: DateFormat.Hm().format(messageData.timeSent),
//             )
//                 : SendermessageCard(
//               message: messageData.text,
//               date: DateFormat.Hm().format(messageData.timeSent),
//             );
//           },
//         );
//       }
//     );
//   }
// }
