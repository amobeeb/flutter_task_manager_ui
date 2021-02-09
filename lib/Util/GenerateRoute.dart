import 'package:flutter/material.dart';
import 'package:task_manager/Screen/Home.dart';
import 'package:task_manager/Screen/Task/AddTask.dart';
import 'package:task_manager/Screen/Task/Task.dart';

class GenerateRoute{
  static Route <dynamic> generatedRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name){
      case '/':
      return MaterialPageRoute(builder: (_)=> Home());
       break;
       case '/task':
      return MaterialPageRoute(builder: (_)=>Task());
       case '/addtask':
      return MaterialPageRoute(builder: (_)=>AddTask());
      break;
      default:
      return MaterialPageRoute(builder: (_)=> Home());
    }
  }
}