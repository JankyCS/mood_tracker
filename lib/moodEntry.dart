import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class MoodEntry {
  const MoodEntry(this.mood, this.why, this.date, [this.valid = true]);
  final double mood; //Mood from -5 (unhappy)+5 (happy)
  final List<int>
      why; //Each int in list represents a reason for the given mood, ie. 1 = job, 2= hobby 3=friends, 4=video game, 5=music, etc.
  final DateTime date; //0=morning, 1=noon, 2=night
  final bool valid;
  List dbEntry() {
    //List t = [mood,date];
    return [
          mood,
          date.toIso8601String(),
        ] +
        why;
  }

  factory MoodEntry.fromJson(Map<String, dynamic> parsedJson) {
    for (int i = 0; i < 12; i++) {
      var val = parsedJson['r$i'];
      if (val != 1 && val != 0) {
        throw Exception("invalid value:" + val.toString());
      }
    }
    var moodVal = parsedJson['mood'];
    if (moodVal == null || moodVal is! double || moodVal < -5 || moodVal > 5) {
      throw Exception("Mood not in range");
    }

    var d = DateTime.parse(parsedJson['date']);
    List<int> y = [
      parsedJson['r0'],
      parsedJson['r1'],
      parsedJson['r2'],
      parsedJson['r3'],
      parsedJson['r4'],
      parsedJson['r5'],
      parsedJson['r6'],
      parsedJson['r7'],
      parsedJson['r8'],
      parsedJson['r9'],
      parsedJson['r10'],
      parsedJson['r11'],
    ];
    return new MoodEntry(parsedJson['mood'], y, d);
  }
}
