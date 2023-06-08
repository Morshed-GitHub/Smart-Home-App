import 'package:hive/hive.dart';
import 'package:smart_home_app/utils/constants.dart';

class Boxes {
  static late Box<dynamic> box;

  /// Opens the Hive box
  static Future<void> openBox() async {
    box = await Hive.openBox(BOX_NAME);
  }

  /// Creates or updates a key-value pair in the box
  static Future<void> put({required String key, required dynamic value}) async {
    await box.put(key, value);
  }

  /// Retrieves the value associated with the given key from the box
  static dynamic get({required String key}) {
    return box.get(key);
  }

  /// Creates or updates a key-value pair in the box
  /// If the key already exists, it will be updated with the new value.
  /// If the key does not exist, a new key-value pair will be created.
  static Future<void> update(
      {required String key, required dynamic value}) async {
    await put(key: key, value: value);
  }

  /// Deletes the key-value pair associated with the given key from the box
  static Future<void> delete({required String key}) async {
    await box.delete(key);
  }
}
