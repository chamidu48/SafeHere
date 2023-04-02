import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safehere/colors.dart';
import 'package:safehere/features/auth/controller/auth_controller.dart';
import 'package:safehere/global_styles.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:safehere/screens/calls.dart';
import 'package:safehere/screens/groups.dart';
import 'package:safehere/features/chat/widgets/messages.dart';
import 'package:safehere/screens/settings.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends ConsumerState<HomeScreen> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    ref.read(authControllerProvider).setUserState(true);
    WidgetsBinding.instance.addObserver(this);
  }
  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch(state){
      case AppLifecycleState.resumed:
        ref.read(authControllerProvider).setUserState(true);
        break;
      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
        ref.read(authControllerProvider).setUserState(false);
        break;
    }
  }

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
      backgroundColor: bodyColor1,
      body: bodyScrenns[currentIndex],
      bottomNavigationBar: buildBottomNavigation(),
    );
  }

  Widget buildBottomNavigation(){
    return Container(
      decoration: BoxDecoration(
        color: appbarColor1
      ),
      padding: const EdgeInsets.only(bottom:20,left: 15,right: 15,top: 15),
      child: GNav(
        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
        backgroundColor:appbarColor1,
        color: Colors.white70,
        activeColor: Colors.white,
        tabBackgroundColor: chatcardSelectedColor,
        selectedIndex: currentIndex,
        gap: 8,
        iconSize: 20,
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
