import 'package:flutter/material.dart';
import 'package:safehere/features/chat/widgets/sender_message_card.dart';
import 'package:safehere/screens/messages.dart';

import '../../../info.dart';
import 'my_message_card.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context,index){
        return messages[index]['isMe']==true?
        MyMessageCard(
          message: messages[index]['text'].toString(),
          date: messages[index]['time'].toString(),
        )
            : SendermessageCard(
          message: messages[index]['text'].toString(),
          date: messages[index]['time'].toString(),
        );
      },
    );
  }
}
