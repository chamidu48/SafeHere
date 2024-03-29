import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safehere/features/auth/repository/auth_repository.dart';

import '../../../models/user_model.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository, ref: ref);
});

final userDataAuthProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider);
  return authController.getUserData();
});

class AuthController{
  final AuthRepository authRepository;
  final ProviderRef ref;

  AuthController({required this.authRepository,required this.ref});


  Future<UserModel?> getUserData() async {
    UserModel? user = await authRepository.getCurrentUserData();
    return user;
  }

  void logInWithPhone(BuildContext context,String phoneNumber){
    authRepository.loginWithPhone(context, phoneNumber);
  }

  void signInWithPhone(BuildContext context,String phoneNumber){
    authRepository.signUpWithPhone(context, phoneNumber);
  }

  void verifyOTP(BuildContext context, String verificationId, String userOTP,bool isLogIn) {
    if(isLogIn){
      authRepository.verifyOTPlogin(
        context: context,
        verificationId: verificationId,
        userOTP: userOTP
      );
    }
    else{
      authRepository.verifyOTPsignin(
        context: context,
        verificationId: verificationId,
        userOTP: userOTP,
      );
    }
  }
  void saveUserDataToFirebase(
      BuildContext context, String name, File? profilePic,String bio) {
    authRepository.saveUserDataToFirebase(
      name: name,
      profilePic: profilePic,
      bio: bio,
      ref: ref,
      context: context,
    );
  }
  Stream<UserModel> userDataById(String userId){
    return authRepository.userData(userId);
  }

  void setUserState(bool isOnline){
    authRepository.setUserState(isOnline);
  }

}