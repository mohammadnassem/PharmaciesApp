import 'package:get_storage/get_storage.dart';

class SceureStorage {
  final GetStorage storage = GetStorage();

  Future<void> save(String key, String value) async {
    await storage.write(key, value);
  }

  Future<String?> read(String key) async {
    return storage.read(key);
  }

  Future<String?> remove(String key) async {
    await storage.remove(key);
  }
}
