import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safehere/colors.dart';
import 'package:safehere/features/chat/widgets/chat_list.dart';
import 'package:safehere/global_styles.dart';
import 'package:safehere/widgets/buttons.dart';

import '../../../info.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyColor1,
      appBar: AppBar(
        backgroundColor: appbarColor1,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: chatcardSelectedColor,
              backgroundImage: NetworkImage(
                info[0]['profilePic'].toString(),
              ),
              radius: 18,
            ),
            SizedBox(width: 15,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    info[0]['name'].toString(),
                    style: appbartitle,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  ),
                  Text('Online',style: appbarStatus,)
                ],
              ),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.call)),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
        ],
      ),
      body: Column(
        children: [
          Expanded(child: ChatList()),
          Container(
            height: 80,
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: TextField(
                    style: textfieldfilled,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: appbarColor1,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Icon(Icons.emoji_emotions, color: Colors.grey,),
                      ),
                      hintText: 'Type a message!',
                      hintStyle: textfieldfilled,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(20),
                    ),
                  ),
                ),
                SizedBox(width: 5,),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Icon(Icons.send),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      primary: Colors.white,
                      minimumSize: Size(50,60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                  )
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

