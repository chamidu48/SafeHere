
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
        appBar: AppBar(
          title: Text('Settings',style: appbartitle,),
          centerTitle: true,
          backgroundColor: bodyColor1,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,color: Colors.white,),
            onPressed: (){},
          ),
          actions: [
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.more_vert),
            )
          ],
        ),
        backgroundColor: bodyColor1,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 30, 25, 5),
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context,'/useredit');
                  },
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: appbarColor1,
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                      leading: CircleAvatar(
                        backgroundColor: chatcardSelectedColor,
                        backgroundImage: NetworkImage(
                          info[6]['profilePic'].toString(),
                        ),
                        radius: 40,
                      ),
                      title: Text(info[6]['name'].toString(),style: cardHeading,),
                      subtitle: Text('_username_',style: cardSubtitle,),
                      trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                Divider(color: appbarColor1,thickness: 1),
                SizedBox(height: 20,),
                Expanded(
                  child: ListView.builder(
                    itemCount: settings.length,
                    itemBuilder: (BuildContext,index){
                      return ListTile(
                        onTap: (){},
                        contentPadding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                        tileColor: bodyColor1,
                        leading: Icon(IconData[index],color: chatcardSelectedColor,),
                        title: Text(settings[index],style: chatTileTitle,),
                        trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
      )
    );
  }
}
