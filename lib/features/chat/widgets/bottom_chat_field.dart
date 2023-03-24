import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safehere/features/chat/controller/chat_controller.dart';

import '../../../colors.dart';
import '../../../global_styles.dart';

class BottomChatField extends ConsumerStatefulWidget {
  final String recieverUserId;
  BottomChatField({Key? key,required this.recieverUserId}) : super(key: key);

  @override
  ConsumerState<BottomChatField> createState() => _BottomChatFieldState();
}

class _BottomChatFieldState extends ConsumerState<BottomChatField> {

  final _messageInputController=TextEditingController();

  void sendTextMessage()async{
    ref.read(chatControllerProvider).sendTextMessage(
        context, _messageInputController.text.trim(), widget.recieverUserId);
    setState(() {
      _messageInputController.text="";
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _messageInputController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: TextField(
              controller: _messageInputController,
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
                onPressed: sendTextMessage,
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
    );  }
}
