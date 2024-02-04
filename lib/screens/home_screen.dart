import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/tasks_provider.dart';
import '../widgets/input_fields.dart';
import '../models/task.dart';
import '../widgets/main_drawer.dart';
import '../widgets/task_card.dart';



class MyHome extends StatefulWidget{

  static const routeName = '/';

  
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {





  showInputSheet(BuildContext context, List<Task> taskList,final Function addTask)
  {
    return showModalBottomSheet(

      context: context,
      
      builder:(ctx) =>InputFields(addTask,taskList) , 
      isScrollControlled:false);
  }

    @override

    Widget build(BuildContext context)
    {

      final tasksData = Provider.of<Tasks>(context);

      final MediaQueryData mediaQuery =MediaQuery.of(context); 


      return Scaffold(

        appBar: AppBar(
        
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('Timely Tasks'),
          actions: <Widget>[

            IconButton(onPressed: (){
              showInputSheet(context,tasksData.tasks,tasksData.addTask);
            }, icon: Icon(Icons.add))
            
          
          ],

        ),
        drawer: MainDrawer(),

        body: SingleChildScrollView(
          child: Column(
        
            children: [
              if(tasksData.tasks.isEmpty) Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                     
                             Container(
                              alignment: Alignment.topCenter,
                              child: Text('Add your Tasks here !',style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),),
                              
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          
                          Container(height:mediaQuery.size.height * 0.6,width: double.maxFinite,child: Image.asset('assets/images/waitingf.png',color: Theme.of(context).primaryColor,fit: BoxFit.fill,)),
                        ],
                      
                    ),
              ),
                
              
              // InputFields(),
               if(tasksData.tasks.isNotEmpty)
              Container(
                padding: EdgeInsets.all(25),
                height: mediaQuery.size.height * 0.8,
                // padding: EdgeInsets.all(5),
                child: ListView.builder(
                  
                  itemBuilder: (ctx, index) => TaskCard(tasksData.tasks[index],tasksData.deleteTask,tasksData.doneTaskUpdate),itemCount: tasksData.tasks.length,),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
           showInputSheet(context,tasksData.tasks,tasksData.addTask);

        },child: const Icon(Icons.add)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      );

    }
}