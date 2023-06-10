import 'package:flutter/material.dart';
import 'package:gift_grab/screens/game_play.dart';
import 'package:gift_grab/services/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveService.openHiveBox(boxName: 'settings');

  runApp(
    const MaterialApp(
      home: GamePlay(),
    ),
  );
}
