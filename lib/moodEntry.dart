import 'package:sqflite/sqflite.dart';

class MoodEntry {
  const MoodEntry(this.mood,this.why,this.time);
  final double mood; //Mood from -5 (unhappy)+5 (happy)
  final List<bool> why; //Each int in list represents a reason for the given mood, ie. 1 = job, 2= hobby 3=friends, 4=video game, 5=music, etc.
  final int time; //0=morning, 1=noon, 2=night
}

  List<MoodEntry> addMood(double mood,List<bool> why,int time){
      List<MoodEntry> moods= [];
      moods.add(MoodEntry(mood, why, time));
      moods.forEach((element) {
        print("----");
        print("Mood is"+element.mood.toString());
        print("Reasons is is"+element.why.toString());
      });
      return moods;
}
