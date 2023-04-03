import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:http/http.dart' as http;
import 'package:pospan/navigation/routes.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( debugShowCheckedModeBanner: false, 
      title: 'POSPAN',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RouterClass.gethomePage(),
      getPages: RouterClass.routes,
      //home: const MyHomePage(),
    );
  }
}
// SELECT * FROM `detalles` WHERE `ordenesid` = '963639d4-131b-42b6-96c5-c52fa40bcd49';
