import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  runApp(MyApp());
  Scheduler().setupAlarm();

  // Runs because the FAQ plugin is loaded correctly.
  final demoSongList = await FlutterAudioQuery().getSongs();
  print('Main function: ${demoSongList.length}');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Sample Text', textDirection: TextDirection.ltr,));
  }
}

class Scheduler {
  setupAlarm() async {
    print('Setting up alarm!');
    final success = await AndroidAlarmManager.oneShot(Duration(seconds: 3), 42, callback);
    print(success);
  }

  static callback() async {
    // Requires FAQ plugin to be loaded which it isn't.
    final songs = await FlutterAudioQuery().getSongs();
    print('Callback ${songs.length}!');
  }
}
