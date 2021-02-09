import 'package:flutter/material.dart';
import 'package:task_manager/Util/Color.dart';  
import 'Util/GenerateRoute.dart';
 
 ThemeData _myTheme() {
         ThemeData base = ThemeData.light();
        return base.copyWith( 
          primaryColor: Color(AppColors.primaryColor),
          accentColor: Color(AppColors.secondaryColor),
           appBarTheme: AppBarTheme( 
             iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            color: Color(AppColors.primaryColor)
           ),
           scaffoldBackgroundColor: Color(AppColors.primaryColor),
            textTheme: _myTextTheme(base.textTheme)
         );
           
       }
       TextTheme _myTextTheme(TextTheme base){
          return base.copyWith(
            headline1: TextStyle(
              fontSize: 30.0, 
               fontWeight: FontWeight.w400,
              color: Color(AppColors.secondaryColor)
             ),
            headline2: TextStyle( 
              fontSize: 14.0,
              color: Color(AppColors.headerText2) 
            ),
            bodyText1: TextStyle( 
              fontSize: 14.0,
              color: Colors.white
            ),
            bodyText2: TextStyle( 
              fontSize: 14.0,
              color: Colors.white
            )
          );
       }
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _myTheme(),
      title: 'Task Manager', 
      initialRoute: '/',  
       onGenerateRoute: GenerateRoute.generatedRoute,
        );
      }
      
       
}
 