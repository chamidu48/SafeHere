import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safehere/common/utils/utils.dart';

final authRepositoryProvider=Provider((ref)=>
    AuthRepository(
      auth: FirebaseAuth.instance,
      firestore: FirebaseFirestore.instance,
    ),
);

class AuthRepository{
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRepository({
    required this.auth,
    required this.firestore
  });

  void signInWithPhone(BuildContext context,String phoneNumber)async{
    try{
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          throw Exception(e.message);
        },
        codeSent: ((String verificationId, int? resendToken) async {
          Navigator.pushNamed(
            context,
            '/otpsignin',
            arguments: verificationId,
          );
        }),
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    }catch(e){
      showSnackBar(context: context, content: e.toString());
    }
  }

  void verifyOTP({
    required BuildContext context,
    required String verificationId,
    required userOTP,
    required bool isSignIn,
  })async {
    try{
      PhoneAuthCredential credential=PhoneAuthProvider.credential(verificationId: verificationId, smsCode: userOTP);
      await auth.signInWithCredential(credential);
      isSignIn?Navigator.pushNamedAndRemoveUntil(
        context,
        '/verify', (route) => false,
      ):Navigator.pushNamedAndRemoveUntil(
        context,
        '/home', (route) => false,
      );
    }
    catch(e){
      showSnackBar(context: context, content: e.toString() );
    }
  }
}