import 'package:flutter/material.dart';
import 'package:safehere/colors.dart';
import 'package:safehere/global_styles.dart';
import 'package:safehere/info.dart';
import 'package:safehere/widgets/buttons.dart';
class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  String dropdownValue = 'Select Reason';

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarColor1,
        title: Text('Submit a Report',style: appbartext,),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: bodyColor1,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 35,vertical: 20),
          children: [
            Container(
              decoration: BoxDecoration(
                  color: appbarColor1,
                  borderRadius: BorderRadius.circular(5)
              ),
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget>[
                      Text(
                        'Report',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          info[0]['name'].toString(),
                        style: subtitle
                      ),
                    ]
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "What is the reason?",
                    style: subtitlebold
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15,),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    color: appbarColor1,
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: textfieldfilled,
                      onChanged: (String? newValue){
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      dropdownColor: appbarColor1,
                      items: <String>['Select Reason','Option 1', 'Option 2']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,style: textfieldfilled,),
                        );
                      }).toList(),
                      iconEnabledColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Submit Proof',
                  style: subtitlebold
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: (){
                    print('upload');
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Upload',
                            style: buttonwhite
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.file_upload,
                            size: 25,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'This will be visible to the user He is a strong animal with large eyes,'
                      ' four legs, a large head, and sharp teeth that help him to hunt and eat his prey.',
                  textAlign: TextAlign.center,
                  style: cardSubtitle
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (){print('blocked');},
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                          'Block user',style: buttonwhite,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (){print('reported');},
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'Submit',
                        style: buttonblue
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                       print('cancelled');
                    },
                    child: Text(
                      'Cancel',
                      style: textbutton
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      )
    );
  }
}
