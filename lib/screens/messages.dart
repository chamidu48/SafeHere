import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safehere/colors.dart';
import 'package:safehere/info.dart';

import '../global_styles.dart';

class Messenger extends StatefulWidget {
  const Messenger({Key? key}) : super(key: key);

  @override
  _MessengerState createState() => _MessengerState();
}

class _MessengerState extends State<Messenger> {
  @override
  Widget build(BuildContext context) {
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
      body: ListView.builder(
        itemCount: info.length,
        itemBuilder: (BuildContext,int){
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            title: Text(info[int]['name']!.toString(),style: chatTileTitle),
            subtitle: Text(info[int]['message']!.toString(),style: chatTileSubTitle,),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text(info[int]['time']!.toString(),style: chatTileTime,),
                Text('delivered',style: chatTileTime,)
              ],
            ),
            leading: CircleAvatar(
              backgroundColor: chatcardSelectedColor,
              backgroundImage: NetworkImage(
                info[int]['profilePic'].toString(),
              ),
              radius: 30,
            ),
            tileColor: info[int]['seen']==true?chatcardSelectedColor:bodyColor1,
            onTap: (){
              Navigator.pushNamed(context, '/chatscreen');
            },
            onLongPress: (){},
            splashColor: chatcardSelectedColor,
            focusColor: chatcardSelectedColor,
          );}
      ),
      floatingActionButton: buildFloatingButton(),
    );
  }
  Widget buildFloatingButton(){
    return FloatingActionButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(Icons.edit),
      elevation: 0,
      splashColor: chatcardSelectedColor,
      onPressed: (){},
    );
  }
}
