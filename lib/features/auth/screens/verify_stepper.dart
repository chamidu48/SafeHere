

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safehere/common/utils/utils.dart';

import '../../../colors.dart';
import '../../../global_styles.dart';

class VerifyStepper extends StatefulWidget {
  const VerifyStepper({Key? key}) : super(key: key);

  @override
  _VerifyStepperState createState() => _VerifyStepperState();
}

class _VerifyStepperState extends State<VerifyStepper> {

  File? idFront;
  File? idBack;
  File? selfie;

  int _index = 0;
  bool isLastStep=false;

  Future pickIdFront(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.idFront = imageTemporary);
    } on PlatformException catch (e) {
      showSnackBar(context: context, content: "Failed to get image");
    }
  }
  Future pickIdBack(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.idBack = imageTemporary);
    } on PlatformException catch (e) {
      showSnackBar(context: context, content: "Failed to get image");
    }
  }
  Future pickSelfie(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.selfie = imageTemporary);
    } on PlatformException catch (e) {
      showSnackBar(context: context, content: "Failed to get image");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appbarColor,
        title: Text('Upload Documents',style: appbartext),
        centerTitle: true,
      ),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _index,
        onStepCancel: () {
          if (_index > 0) {
            setState(() {
              _index -= 1;
            });
          }
        },
        onStepContinue: () {
          if(_index<2){
            setState(() {
              _index += 1;
              setState(() {
                print(_index);
              });
            });
          }else Navigator.popAndPushNamed(context, '/verifydone');

          // isLastStep=_index==1;
          // if (isLastStep) {
          //   setState(() {
          //     _index += 1;
          //     print(_index);
          //   });
          //   print('Completed');
          // }else
        },
        onStepTapped: (int index) {
          setState(() {
            _index = index;
          });
        },

        steps: <Step>[
          Step(
            state: _index>0?StepState.complete:StepState.indexed,
            isActive: _index>=0,
            title: const Text('Front side'),
            content: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Upload your ID',style: headingbold,),
                    Text('Front side',style: subtitleblue,),
                    idFront != null? Image.file(idFront!,width:160,height:160,fit:BoxFit.cover,) : Image.asset('assets/images/id_card.png',height: 120),
                    Text('Upload a front side image of your Document',style: subtitleblue,),
                    SizedBox(height: 40),
                    ElevatedButton.icon(
                      label: Text('Upload'),
                      icon: Icon(Icons.upload_rounded),
                      onPressed: () => pickIdFront(ImageSource.gallery),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            minimumSize: Size(180, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))
                        ),
                    ),
                    SizedBox(height: 20,)
                  ],
                ),)
          ),
          Step(
            state: _index>1?StepState.complete:StepState.indexed,
            isActive: _index>=1,
            title: const Text('Back side'),
            content: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Upload your ID',style: headingbold,),
                    Text('Back side',style: subtitleblue,),
                    idBack != null? Image.file(idBack!,width:160,height:160,fit:BoxFit.cover,) : Image.asset('assets/images/id_card.png',height: 120),
                    Text('Upload a back side image of your Document',style: subtitleblue,),
                    SizedBox(height: 40),
                    ElevatedButton.icon(
                      label: Text('Upload'),
                      icon: Icon(Icons.upload_rounded),
                      onPressed: ()=> pickIdBack(ImageSource.gallery),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          minimumSize: Size(180, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))
                      ),
                    ),
                    SizedBox(height: 20,)
                  ],
                ),),
          ),
          Step(
            isActive: _index>=2,
            title: const Text('Selfi photo'),
            content: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Upload your photo',style: headingbold,),
                    Text('Selfie',style: subtitleblue,),
                    selfie != null? Image.file(selfie!,width:140,height:140,fit:BoxFit.cover,) : Image.asset('assets/images/id_card.png',height: 120),
                    Text('Capture a selfie photo of yourself',style: subtitleblue,),
                    SizedBox(height: 40),
                    ElevatedButton.icon(
                      label: Text('Capture'),
                      icon: Icon(Icons.photo),
                      onPressed: ()=> pickSelfie(ImageSource.camera),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          minimumSize: Size(180, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))
                      ),
                    ),
                    SizedBox(height: 20,)
                  ],
                ),),
          ),
        ],
      )
    );
  }
}
