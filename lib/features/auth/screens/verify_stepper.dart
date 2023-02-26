import 'package:flutter/material.dart';

class DocumentVerify extends StatefulWidget {
  const DocumentVerify({Key? key}) : super(key: key);

  @override
  _DocumentVerifyState createState() => _DocumentVerifyState();
}

class _DocumentVerifyState extends State<DocumentVerify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('document verify'),
      ),
    );
  }
}
