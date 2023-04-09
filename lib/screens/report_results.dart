import 'dart:convert';
import 'dart:io';

// import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:http/http.dart' as http;


import 'package:flutter/material.dart';

import '../common/utils/utils.dart';

class Results extends StatefulWidget {
  const Results({Key? key}) : super(key: key);

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  String? text;
  String prediction='';
  bool isLoading=true;

  //
  // Future<void> extractText(File image,BuildContext context)async{
  //   try{
  //     final inputImage = InputImage.fromFile(image!);
  //     final textRecognizer = GoogleMlKit.vision.textRecognizer();
  //     final recognizedText = await textRecognizer.processImage(inputImage);
  //     setState(() {
  //       text = recognizedText.text;
  //       isLoading=false;
  //     });
  //   }
  //   catch(e){
  //     showSnackBarRed(context: context, content: e.toString());
  //   }
  // }

  Future getPrediction(String messages,BuildContext context)async{
    try{
      var headers={'Content-type':'application/json'};
      var request = await http.Request('POST',Uri.parse("http://127.0.0.1:8000"));
      request.body=jsonEncode({"Sentence":"I will kill you"});
      request.headers.addAll(headers);
      http.StreamedResponse response=await request.send();
      if(response.statusCode==200){
        setState(() async{
          prediction=await response.stream.bytesToString();
          isLoading=false;
        });
      }else{
        response.reasonPhrase;
      }
    }catch(e){
      showSnackBarRed(context: context, content: e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('init ran');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userinfo=ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    final username=userinfo['name'];
    final uid=userinfo['uid'];
    final img=userinfo['img'];
    // extractText(img, context);
    getPrediction("I will kill you", context);

    return Scaffold(
      body: SafeArea(
          child: isLoading?Center(
            child: CircularProgressIndicator(color: Colors.red,),
          ): Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Text(username),
                    Text("User $username was reported. Total results :"),
                    // Text("Extracted text: "+text!),
                    Text("Prediction: "+prediction)
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
