import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class MoodEntry {
  const MoodEntry(this.mood,this.why,this.date);
  final double mood; //Mood from -5 (unhappy)+5 (happy)
  final List<int> why; //Each int in list represents a reason for the given mood, ie. 1 = job, 2= hobby 3=friends, 4=video game, 5=music, etc.
  final DateTime date; //0=morning, 1=noon, 2=night

  List dbEntry() {
    //List t = [mood,date];
    return [mood,date.toIso8601String(),]+why;
  }

}

  