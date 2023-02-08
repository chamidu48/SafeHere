import 'package:flutter/material.dart';
import 'package:safehere/colors.dart';
import 'package:safehere/global_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyColor,
      appBar: AppBar(
        title: Text('SafeHere',style: appbartitle,),
        automaticallyImplyLeading: false,
        backgroundColor: appbarColor,
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
      body: Container(),
      bottomNavigationBar: buildBottomNavigation(),
    );
  }

  Widget buildBottomNavigation(){
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.messenger_outline_rounded),
          label: 'messenger',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.group),
          label: 'groups'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.call),
          label: 'calls'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'settings'
        ),
      ],
      backgroundColor: bodyColor,
      onTap: (index){},
      elevation: 0,
      currentIndex: 0,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }
}
