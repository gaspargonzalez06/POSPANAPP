import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pospan/services/services.dart';
import 'package:pospan/views/tables/tabla_detalles.dart';
import 'package:pospan/views/tables/tabla_ordenes.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Ordenes"), leading:  BackButton(onPressed:(){
      Get.back();
    } ,
    color: Colors.black,
    
  ),),body:Padding(
    padding: const EdgeInsets.all(8.0),
    child: 
      Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,children: [
         Container(child: OrdenesTable(futureData: AppsSerices().getOrdenes())),
    
      
      ],
      
      
      
      
      ),
    
  ));
  }
}

