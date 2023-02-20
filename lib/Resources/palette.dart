
//palette.dart
import 'package:flutter/material.dart'; 
class Palette { 
  static const MaterialColor kToDark =  MaterialColor( 
    0xff000000, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch. 
     <int, Color>{ 
       50:  Color(0xffce5641 ),//10% 
      100:  Color(0xffb74c3a),//20% 
      200:  Color(0xffa04332),//30% 
      300:  Color(0xff8A8A8A),//40% 
      400:  Color(0xff737373),//50% 
      500:  Color(0xff5C5C5C),//60% 
      600:  Color(0xff454545),//70% 
      700:  Color(0xff2E2E2E),//80% 
      800:  Color(0xff171717),//90% 
      900:  Color(0xff000000),//100% 
    }, 
  ); 
}