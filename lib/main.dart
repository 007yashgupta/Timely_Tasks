import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './models/task.dart';
import './provider/tasks_provider.dart';
import './screens/complete_tasks.dart';
import './screens/pending_tasks.dart';
import './screens/home_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  
  

 
  @override

  Widget build(BuildContext context)
  {

    return ChangeNotifierProvider(
      create: (context) => Tasks(),

      child: MaterialApp(
    
        theme: ThemeData(
          canvasColor: Colors.white,
          accentColor: Colors.amber,
          primarySwatch: Colors.purple,
          primaryColor: Colors.purple,
          textTheme: TextTheme(
            titleMedium: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
    
    
            ),
    
      
    
    
    
            bodyMedium: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
    
    
            ),
    
            displayLarge: TextStyle(
              
    
            ),
    
          ),
        ),
        title: 'Timely Tasks',
    
        // home: MyHome(),
        routes: {
          MyHome.routeName :(ctx) => MyHome(),
          CompleteTasks.routeName : (ctx)=> CompleteTasks(),
          PendingTasks.routeName : (ctx)=> PendingTasks(),
    
    
        },
    
      ),
    );







  }

  


}



