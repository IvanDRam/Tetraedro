import 'package:flutter/material.dart';
import 'package:tetraedro/tetraedo.dart';

class MyApp extends StatelessWidget{

  @override
  Widget build(context){
    return MaterialApp(
      debugShowCheckedModeBanner: false, //para quitar el modo beta de la esquina
      home: Center(
        //child: HomePage(),
        child: Tetraedro(),
        ),
      
    );
  }
}