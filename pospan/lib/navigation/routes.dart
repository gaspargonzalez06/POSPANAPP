import 'package:get/get.dart';
import 'package:pospan/main.dart';
import 'package:pospan/views/home_page.dart';

import '../views/dashboard.dart';



class RouterClass{
  static String dashboard = "/dashboard";
  static String home = "/";
   static String detalles = "/detalles";

  
  static String getOrdenesRoute()=>dashboard;
 static String gethomePage()=>home;
  //static String gethomePage()=>home;

  static List<GetPage> routes=[
    GetPage(name: dashboard, page:()=> const DashboardPage()),
     GetPage(name: home, page:()=> const MyHomePage()),
       //GetPage(name: home, page:()=> const MyHomePage())


  ];
  
  }