import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safehere/common/utils/utils.dart';
import 'package:safehere/models/user_model.dart';

import '../../../common/repositories/firebase_storage_repo.dart';

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
  Future<UserModel?> getCurrentUserData() async {
    var userData = await firestore.collection('users').doc(auth.currentUser?.uid).get();

    UserModel? user;
    if (userData.data() != null) {
      user = UserModel.fromMap(userData.data()!);
    }
    return user;
  }

  void signUpWithPhone(BuildContext context,String phoneNumber)async{
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
            '/otp',
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
    // required bool isSignIn,
  })async {
    try{
      PhoneAuthCredential credential=PhoneAuthProvider.credential(verificationId: verificationId, smsCode: userOTP);
      UserCredential userCredential=await auth.signInWithCredential(credential);

      if(userCredential.additionalUserInfo?.isNewUser==true){
        showSnackBar(context: context, content: "Account not found!");
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/signup', (route) => false,
        );
      }else{
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/home', (route) => false,
        );
      }
    }
    catch(e){
      showSnackBar(context: context, content: e.toString() );
    }
  }

  void saveUserDataToFirebase({
    required String name,
    required String bio,
    required File? profilePic,
    required ProviderRef ref,
    required BuildContext context
  })async{
    try{
      String uid=auth.currentUser!.uid;
      String photoUrl =
          'https://png.pngitem.com/pimgs/s/649-6490124_katie-notopoulos-katienotopoulos-i-write-about-tech-round.png';

      if (profilePic != null) {
        photoUrl = await ref
            .read(commonFirebaseStorageRepositoryProvider)
            .storeFileToFirebase(
          'profilePic/$uid',
          profilePic,
        );
      }

      var user=UserModel(
          name: name,
          uid: uid,
          bio: bio,
          profilePic: photoUrl,
          isOnline: true,
          phoneNumber: auth.currentUser!.phoneNumber.toString());

      await firestore.collection('users').doc(uid).set(user.toMap());

      Navigator.pushNamedAndRemoveUntil(
        context,
            '/home',
            (route) => false,
      );

    }catch(e){
      showSnackBar(context: context, content: e.toString());
    }
  }
}