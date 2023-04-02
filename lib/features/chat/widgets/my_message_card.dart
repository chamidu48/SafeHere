
import 'package:flutter/material.dart';
import 'package:safehere/colors.dart';
import 'package:safehere/global_styles.dart';

class MyMessageCard extends StatelessWidget {

  final String message;
  final String date;
  final bool isSeen;

  const MyMessageCard(
      {Key? key, required this.message, required this.date, required this.isSeen}
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 30,
                  top: 5,
                  bottom: 20,
                ),
                child: Text(
                  message,
                  style: mymessagetext
                ),
              ),
              Positioned(
                bottom: 4,
                right: 35,
                child: Text(
                    date,
                    style:mymessagetext
                )
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: isSeen?Icon(
                  Icons.done_all,
                  size: 20,
                  color: primaryColor,
                ):Icon(
                  Icons.done,
                  size: 20,
                  color: Colors.grey,
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
