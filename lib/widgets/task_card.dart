import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final Function deleteTask;
  final Function doneTaskUpdate;
  

  TaskCard(this.task, this.deleteTask,this.doneTaskUpdate);

   icon(String ?cat) {
    if (cat == 'Life') {
      return Icon(Icons.event_available);
    } else if (cat == 'Work') {
      return Icon(Icons.work);
    } else if (cat == 'Wellness') {
      return Icon(Icons.fitness_center);
    } else if (cat == 'Social') {
      return Icon(Icons.people);
    } else if (cat == 'Finance') {
      return Icon(Icons.attach_money);
    }
  }

  Color? colorCardPriority(String priority) {
    switch (priority) {
      case 'High':
        return Colors.red;

      case 'Medium':
        return Colors.orange;

      case 'Low':
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      // margin: EdgeInsets.all(10),
      // padding: EdgeInsets.all(10),

      child: Card(
        elevation: 6,
        child: Container(
          padding: EdgeInsets.all(
            5,
          ),
          decoration: BoxDecoration(
            border:
                Border.all(width: 5, color:colorCardPriority(task.priority)!,
                 
                ),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(top: 5),
                          width: double.maxFinite,
                          alignment: Alignment.topLeft,
                          child: Text(
                            '${task.startTime.format(context) } - ${task.endTime.format(context)}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                     

                      Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            DateFormat.yMEd().format(task.id),
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if(task.category.isNotEmpty && task.category != null ) icon(task.category),
                        Text(
                          task.category,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    if(task.title !=null)
                    Text(
                      task.title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      doneTaskUpdate(task.id);


                      
                    },
                    icon: Icon(Icons.done_outline),
                    color: Theme.of(context).primaryColor,
                  ),
                  IconButton(
                    onPressed: () {
                      deleteTask(task.id);
                    },
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
