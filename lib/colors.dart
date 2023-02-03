import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//--main colors--
const primaryColor=Color(0xff24527A);
const secondColor=Color(0xff4278A8);
const backgroundGradient=LinearGradient(
  colors:[Color(0xff4278A8),Color(0xff083D6A)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const MaterialColor myColorScheme= MaterialColor(0xff4278A8,<int,Color>{
  50:Color(0xffedf3f8),
  100:Color(0xffc8dae9),
  200:Color(0xffa3c1db),
  300:Color(0xff7fa8cd),
  400:Color(0xff5a8fbe),
  500:Color(0xff4176a5),
  600:Color(0xff325c80),
  700:Color(0xff24415c),
  800:Color(0xff162737),
  900:Color(0xff070d12)
});
