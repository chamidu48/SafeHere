import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safehere/colors.dart';
import 'package:safehere/features/auth/screens/login_screen.dart';
import 'package:safehere/features/auth/screens/otpverify_screen.dart';
import 'package:safehere/features/auth/screens/user_info_screen.dart';
import 'package:safehere/features/auth/screens/verify_documentselect.dart';
import 'package:safehere/features/auth/screens/verify_stepper.dart';
import 'package:safehere/features/chat/screens/chat_screen.dart';
import 'package:safehere/features/landing/screens/landing_screen.dart';
import 'package:safehere/firebase_options.dart';
import 'package:safehere/screens/calls.dart';
import 'package:safehere/screens/groups.dart';
import 'package:safehere/screens/home_screen.dart';
import 'package:safehere/screens/messages.dart';
import 'package:safehere/screens/report_screen.dart';
import 'package:safehere/screens/settings.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:safehere/widgets/loader.dart';

import 'features/auth/controller/auth_controller.dart';
import 'features/auth/screens/otpverify_signin.dart';
import 'features/auth/screens/signup_screen.dart';
import 'features/auth/screens/verify.dart';
import 'features/auth/screens/verify_done.dart';
import 'features/contacts/screens/select_contacts_screen.dart';
import 'features/user/user_edit.dart';
import 'features/user/user_view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
      const ProviderScope(child: MyApp()));
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: myColorScheme,
//         scaffoldBackgroundColor: myColorScheme[700],
//         accentColor: myColorScheme[400],
//       ),
//       routes: <String,WidgetBuilder>{
//         '/':(context)=>SplashScreen(),
//         '/landing':(context)=>LandingScreen(),
//         '/login':(context)=>LoginScreen(),
//         '/signup':(context)=>SignUpScreen(),
//         '/otp':(context)=>OTPscreen(),
//         '/otpsignin':(context)=>OTPscreenSignIn(),
//         '/getuserinfo':(context)=>UserInfoSelectScreen(),
//         '/home':(context)=>HomeScreen(),
//         '/mesenger':(context)=>Messenger(),
//         '/groups':(context)=>Groups(),
//         '/calls':(context)=>Calls(),
//         '/settings':(context)=>Settings(),
//         '/chatscreen':(context)=>ChatScreen(),
//         '/useredit':(context)=>UserEdit(),
//         '/userview':(context)=>UserView(),
//         '/reportscreen':(context)=>ReportScreen(),
//         '/verify':(context)=>Verify(),
//         '/verifystepper':(context)=>VerifyStepper(),
//         '/selectdocument':(context)=>DocumentSelect(),
//         '/verifydone':(context)=>VerifyDone(),
//         '/loader':(context)=>Loader()
//       },
//       // home: ref.watch(userDataAuthProvider).when(
//       //   data: (user) {
//       //     if (user == null) {
//       //       return const LandingScreen();
//       //     }
//       //     return const HomeScreen();
//       //   },
//       //   error: (err, trace) {
//       //     return Loader();
//       //   },
//       //   loading: () => const Loader(),
//       // ),
//     );
//   }
// }

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: myColorScheme,
        scaffoldBackgroundColor: myColorScheme[700],
        accentColor: myColorScheme[400],
      ),
      routes: <String,WidgetBuilder>{
        // '/':(context)=>SplashScreen(),
        '/landing':(context)=>LandingScreen(),
        '/login':(context)=>LoginScreen(),
        '/signup':(context)=>SignUpScreen(),
        '/otp':(context)=>OTPscreen(),
        '/otpsignin':(context)=>OTPscreenSignIn(),
        '/getuserinfo':(context)=>UserInfoSelectScreen(),
        '/home':(context)=>HomeScreen(),
        '/mesenger':(context)=>Messenger(),
        '/groups':(context)=>Groups(),
        '/calls':(context)=>Calls(),
        '/settings':(context)=>Settings(),
        '/chatscreen':(context)=>ChatScreen(),
        '/useredit':(context)=>UserEdit(),
        '/userview':(context)=>UserView(),
        '/reportscreen':(context)=>ReportScreen(),
        '/verify':(context)=>Verify(),
        '/verifystepper':(context)=>VerifyStepper(),
        '/selectdocument':(context)=>DocumentSelect(),
        '/verifydone':(context)=>VerifyDone(),
        '/loader':(context)=>Loader(),
        '/selectcontacts':(context)=>SelectContacts()
      },
      home: ref.watch(userDataAuthProvider).when(
        data: (user) {
          if (user == null) {
            return const SplashScreen();
          }
          return const HomeScreen();
        },
        error: (err, trace) {
          print(err.toString());
          return const Loader();
        },
        loading: () => const Loader(),
      ),
    );
  }
}


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
        ()=>{
          Navigator.popAndPushNamed(context, '/landing')
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: backgroundGradient
                ),),
              Center(
                child: Container(
                  child: SvgPicture.asset('assets/svg/logo.svg'),
                ),
              )
            ]
        ),
        )
    );
  }
}



