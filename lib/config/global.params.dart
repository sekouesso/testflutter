import 'package:flutter/material.dart';

class GlobalParams{
   static List<Map<String,dynamic>> menus = [
   {
     "title":"Counter","icon":const Icon(Icons.home,color: Colors.orange,),"route":"/counter"
   },
     {
       "title":"Meteo","icon":const Icon(Icons.camera,color: Colors.orange,),"route":"/meteo"
     },
     {
       "title":"Gallery","icon":const Icon(Icons.map,color: Colors.orange,),"route":"/gallery"
     },
     {
       "title":"Login","icon":const Icon(Icons.login,color: Colors.orange,),"route":"/login"
     },
     {
       "title":"Flutter Design","icon":const Icon(Icons.access_alarm_sharp,color: Colors.orange,),"route":"/design"
     },
     {
       "title":"Git users","icon":const Icon(Icons.person,color: Colors.orange,),"route":"/git"
     },
  ];
}