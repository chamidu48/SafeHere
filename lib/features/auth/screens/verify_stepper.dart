import 'package:flutter/material.dart';

import '../../../colors.dart';
import '../../../global_styles.dart';

class VerifyStepper extends StatefulWidget {
  const VerifyStepper({Key? key}) : super(key: key);

  @override
  _VerifyStepperState createState() => _VerifyStepperState();
}

class _VerifyStepperState extends State<VerifyStepper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appbarColor,
        title: Text('Verify',style: appbartext),
        centerTitle: true,
      ),
    );
  }
}
