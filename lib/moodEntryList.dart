import 'package:mood_tracker/moodEntry.dart';

class MoodEntryList {
  final List<MoodEntry> entries;

  MoodEntryList({this.entries});

  factory MoodEntryList.fromJson(List<dynamic> parsedJson) {
    List<MoodEntry> m = new List<MoodEntry>();
    m = parsedJson.map((i) => MoodEntry.fromJson(i)).toList();
    return new MoodEntryList(entries: m);
  }
}
