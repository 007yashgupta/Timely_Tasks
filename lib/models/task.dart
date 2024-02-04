

import 'package:flutter/material.dart';




class Task{

  final String title;
  final String category;
  final String priority;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  

  final DateTime id;

  Task({
    required this.id,
    required this.category,
    required this.title,
    required this.priority ,
    required  this.startTime,
    required this.endTime});

}