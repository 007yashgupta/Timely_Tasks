import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/task.dart';

class DoneTaskCard extends StatelessWidget {

  final Task doneTask;
  final Function deleteTask;

  DoneTaskCard(this.doneTask,this.deleteTask);

  Color colorPriority(String priority)
  {
    switch (priority) {
      case 'H':
      return Colors.red;

      case 'M' :
      return Colors.orange;

      case 'L' :
      return Colors.green;
        
        
      default:
      return Colors.white;
    }
  }
  
  
  
  @override
  Widget build(BuildContext context) {

    final ThemeData theme = Theme.of(context);

    return Container(
      height: 125,
       padding: EdgeInsets.all(5),
     
      child:  Card(
        
       elevation: 6,
        child: Container(
          padding: EdgeInsets.all(
            8,
          ),
          decoration: BoxDecoration(
            border:
                Border.all(width: 5, color:Colors.blueAccent,
                 
                ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Text(doneTask.priority[0],style: TextStyle(
                        color: colorPriority(doneTask.priority[0]),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                    Expanded(
                      child: Text(DateFormat.yMMMEd().format(doneTask.id),style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: theme.primaryColor,
                      ),),
                    ),
                  ],
              
                  
              
                ),
              ),
              Expanded(
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
              
                  children: <Widget>[
                    Expanded(
                      child: Text(doneTask.category,style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: theme.primaryColor,
                      ),),
                    ),
                    Expanded(
                      child: Text(doneTask.title, style:TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: theme.primaryColor, 
                      )),
                    ),
                    
                  ],
                  
              
              
              
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                child: IconButton(onPressed: (){
                        deleteTask(doneTask.id);
                      }, icon: Icon(Icons.delete)),
              ),

            ],
          ),


      ),
      ),
    );
  } 
}