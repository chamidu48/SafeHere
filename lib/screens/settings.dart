import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safehere/colors.dart';

import '../global_styles.dart';
import '../info.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  final settings=['Account','Privacy','Language','Chat','Updates'];
  final IconData=[Icons.account_circle,Icons.lock,Icons.language,Icons.message,Icons.arrow_upward];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 120,
              color: appbarColor,
            ),
            Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      shape: CircleBorder(
                        side: BorderSide(color: Colors.white,width: 4)
                      ),
                      child: CircleAvatar(
                        backgroundColor: chatcardSelectedColor,
                        backgroundImage: NetworkImage(
                          info[5]['profilePic'].toString(),
                        ),
                        radius: 70,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(info[0]['name']!,style: heading2,)
                  ],
                ),
                SizedBox(height: 20,),
                Expanded(
                  child: ListView.builder(
                    itemCount: settings.length,
                    itemBuilder: (BuildContext,int){
                      return Card(
                        color: appbarColor,
                        elevation: 0,
                        child: ListTile(
                          splashColor: chatcardSelectedColor,
                          selectedColor: chatcardSelectedColor,
                          onTap: (){},
                          leading: Icon(IconData[int],color: Colors.white,),
                          title: Text(settings[int],style: chatTileTitle,),
                          trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                        ),
                      );
                    },
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
