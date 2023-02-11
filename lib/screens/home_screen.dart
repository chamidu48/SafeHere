import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safehere/colors.dart';
import 'package:safehere/global_styles.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:safehere/screens/calls.dart';
import 'package:safehere/screens/groups.dart';
import 'package:safehere/screens/messages.dart';
import 'package:safehere/screens/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex=0;
  final bodyScrenns=[Messenger(),Groups(),Calls(),Settings()];
  final titles=['Messeges','Groups','Calls','Settings'];

  void changeIndex(int index){
    setState(() {
      currentIndex=index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyColor,
      appBar: AppBar(
        title: Text(titles[currentIndex],style: appbartitle,),
        automaticallyImplyLeading: false,
        backgroundColor: appbarColor,
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
      body: bodyScrenns[currentIndex],
      bottomNavigationBar: buildBottomNavigation(),
    );
  }

  Widget buildBottomNavigation(){
    return Container(
      decoration: BoxDecoration(
        color: bodyColor
      ),
      padding: const EdgeInsets.only(bottom:20,left: 15,right: 15,top: 15),
      child: GNav(
        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
        backgroundColor: bodyColor,
        color: Colors.white70,
        activeColor: Colors.white,
        tabBackgroundColor: chatcardSelectedColor,
        selectedIndex: currentIndex,
        gap: 10,
        iconSize: 24,
        tabs: [
          GButton(icon: Icons.messenger_outline_rounded),
          GButton(icon: Icons.group),
          GButton(icon: Icons.call),
          GButton(icon: Icons.settings),
        ],
        onTabChange: (int){
          changeIndex(int);
        }
      ),
    );
  }
}
