import 'package:flutter/material.dart';

import 'get_it_injection.dart';
import 'navigation_helper.dart';

navigateTo(Widget page , {bool removeAll = false ,bool replace = false ,Function? onResult })async{
  getIt<NavHelper>().navigate(page,
    removeAll: removeAll,
    replace: replace,
    onResult: onResult,
);
}

void goBack(){
  getIt<NavHelper>().goBack();
}

hideKeyboard(BuildContext context){
  FocusScopeNode scope = FocusScope.of(context);
  if(!scope.hasPrimaryFocus){
    FocusScope.of(context).requestFocus(FocusNode());
  }
}

MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

const String fontRegular = "Cairo";
const String fontMedium = "Cairo";
const String fontBold = "Cairo";
const String fontSemiBold = "Cairo";