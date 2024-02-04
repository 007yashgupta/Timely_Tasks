import 'package:flutter/material.dart';
import 'package:timelytasks/screens/home_screen.dart';
import '../screens/complete_tasks.dart';
import '../screens/pending_tasks.dart';

class MainDrawer extends StatelessWidget{


  void goToCompleteScreen(context)
  {
    Navigator.of(context).pushNamed(CompleteTasks.routeName);
  }

    void goToPendingScreen(context)
  {
    Navigator.of(context).pushNamed(MyHome.routeName);
  }


  Widget build(BuildContext context)
  {


    return Drawer(
      backgroundColor: Colors.white,

      child: Column(
        children: <Widget>[
          Container(

            alignment: Alignment.topLeft,
            
            padding: EdgeInsets.all(25),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text('My Menu',textAlign: TextAlign.center,style: TextStyle(
                color: Theme.of(context).canvasColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                
              ),),
            ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.done_all,color: Theme.of(context).accentColor,),
              title: Text('Completed tasks',style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              onTap: ()=>goToCompleteScreen(context),
              enabled: true,
              splashColor: Theme.of(context).accentColor,
          
          
          
          
          
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.add_task,color: Theme.of(context).accentColor,),
              title:Text('Pending Tasks and Add Tasks',style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              onTap: ()=>goToPendingScreen(context),
              enabled: true,
              splashColor: Theme.of(context).accentColor,
            
          
          
          
          
          
            ),
          ),
        ],
      ),

    );
  
  
  }


  



}