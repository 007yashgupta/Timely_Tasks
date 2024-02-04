import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/task.dart';


class InputFields extends StatefulWidget{

  final Function addTask;
  final List<Task> taskList;

  InputFields(this.addTask,this.taskList);


  @override
  State<InputFields> createState() => _InputFieldsState();
}

class _InputFieldsState extends State<InputFields> {
  TextEditingController titleController=TextEditingController();

  // TextEditingController categoryController=TextEditingController();

  TextEditingController startTimeController=TextEditingController();
  TextEditingController endTimeController=TextEditingController();
  

  final List<String> list=['Life','Work','Wellness','Social','Finance'];
  final List<String> listPriority=['High','Medium','Low'];

  String ?selectedValue;
  String ?selectedPriority;

  bool isTimeBetween(TimeOfDay time1,TimeOfDay time2,TimeOfDay time3)
  {
    int time1Minutes=time1.hour*60+time1.minute;
    int time2Minutes=time2.hour*60+time2.minute;
    int time3Minutes=time3.hour*60+time3.minute;

    return time3Minutes >= time1Minutes && time3Minutes<=time2Minutes;
  }

   _selectTime(context,TextEditingController timeController) async
  {
    final TimeOfDay? picked= await showTimePicker(context: context, initialTime: TimeOfDay.now());
    int index=0;
    while(index <widget.taskList.length)
    {
      if ((isTimeBetween(widget.taskList[index].startTime, widget.taskList[index].endTime,picked as TimeOfDay) ))
      {

        return       showDialog(
        context: context,
        builder: ( context) {
          return AlertDialog(
            title: Text('Time Clash'),
            content: Text('Please set another time.'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      

      


    
    
      }

    index++;

    }
   
    if (picked!=null && picked!=TimeOfDay.now())
    {
      timeController.text = picked.format(context);
    }

  }

  






  @override

  Widget build(BuildContext context)
  {
    return Container(
      padding: EdgeInsets.all(5),
      child: Card(
        elevation: 7,
        child: Column(
          children: [

            DropdownButtonFormField(
              decoration: InputDecoration(
                label: Text('Category'),
              ),
              value: selectedValue,
              items:
              list.map((option) => DropdownMenuItem(child: Text(option),value: option,)
              ).toList() ,
              onChanged: (newValue)
              {
                setState(() {

                  selectedValue=newValue as String;
                  
                });

              }
              ),

            
    
            // TextField(
              

            //   controller: categoryController,
            //   decoration: InputDecoration(
            //     label: Text('Category'),
            //   ),
              
              
    
            // ),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                label: Text('Title'),
              ),
              
              
              
    
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(
                label: Text('Priority'),
              ),
              value: selectedPriority,
              items:
              listPriority.map((option) => DropdownMenuItem(child: Text(option),value: option,)
              ).toList() ,
              onChanged: (newValue)
              {
                setState(() {

                  selectedPriority=newValue as String;
                  
                });

              }
              ),


            TextField(
              controller: startTimeController,
              readOnly: true,
              
              onTap: () => _selectTime(context,startTimeController),
              decoration: InputDecoration(
                labelText: 'Start Time',
                suffixIcon: Icon(Icons.access_time),
              ),
            ),
            
       
    TextField(
              controller: endTimeController,
              readOnly: true,
              onTap: () => _selectTime(context,endTimeController),
              decoration: InputDecoration(
                labelText: 'End Time',
                suffixIcon: Icon(Icons.access_time),
              ),
            ),
      
      SizedBox(
        height: 5,
      ),
      Container(
        alignment: Alignment.bottomRight,
        child: ElevatedButton(
          onPressed: (){
            print(selectedValue);
            print(titleController.text);
            // print(selectedPriority);
            print(startTimeController.text);
            print(endTimeController.text);
            widget.addTask(selectedValue,titleController.text,selectedPriority,TimeOfDay.fromDateTime(DateFormat.jm().parse( startTimeController.text)) ,TimeOfDay.fromDateTime(DateFormat.jm().parse( endTimeController.text)) );
            titleController.clear();
            startTimeController.clear();
            endTimeController.clear();
          }, child: Text('Add Tasks'),
        ),
        )
      ],
      ),
    
      ),
    );
  }
}