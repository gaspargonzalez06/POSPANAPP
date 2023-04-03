import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:http/http.dart' as http;
import 'package:pospan/navigation/routes.dart';
import 'package:pospan/views/tables/tabla_detalles.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});




  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

 

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      
   
      ),
      body: Center(
     
        child: Column(
        
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(height: 250,width: 250,child: ElevatedButton(style: ElevatedButton.styleFrom(
    primary: Colors.blue, //color de fondo azul
    onPrimary: Colors.black, //color de texto negro
  ),child: Text("Iniciar"),onPressed:(){
              //fetchUserData();
              //getDetalles();
           


              Get.toNamed(RouterClass.dashboard);


            },),)
        
           
          ],
        ),
      ),
      
    );
  }
}
