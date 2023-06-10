import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  static Future<Box> openHiveBox({required String boxName}) async {
    if (!kIsWeb && !Hive.isBoxOpen(boxName)) {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }

    return await Hive.openBox(boxName);
  }

  static Future put({
    required String boxName,
    required String key,
    required dynamic value,
  }) async {
    final Box<dynamic> box = Hive.box(boxName);
    await box.put(key, value);
  }

  static Future<dynamic> get({
    required String boxName,
    required String key,
  }) async {
    final Box<dynamic> box = Hive.box(boxName);
    return box.get(key);
  }
}
