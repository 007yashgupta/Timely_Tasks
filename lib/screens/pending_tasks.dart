import 'package:flutter/material.dart';

class PendingTasks extends StatelessWidget{

  static const routeName='pending-tasks';



  @override

  Widget build(BuildContext context)
  {


    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Pending Tasks'),

      ),
      body: Center(child: Text('Pending Tasks')),

    );




  }





}