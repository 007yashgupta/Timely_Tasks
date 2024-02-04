import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/done_task_card.dart';
import '../provider/tasks_provider.dart';

class CompleteTasks extends StatelessWidget{


  static const routeName='/complete-tasks';


  @override

  Widget build(BuildContext context)
  {

    final doneTasks =   Provider.of<Tasks>(context);


    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Completed Tasks'),

      ),
      body:
         ListView.builder(itemBuilder:(context, index) =>  DoneTaskCard(doneTasks.donetasks[index],doneTasks.deleteDoneTask),itemCount: doneTasks.donetasks.length ,padding: EdgeInsets.all(8),),
      
    );




  }





}