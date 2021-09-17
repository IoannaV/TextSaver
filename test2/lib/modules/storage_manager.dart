import 'package:localstorage/localstorage.dart';

class StorageManager {
  final LocalStorage storage = LocalStorage('text_store');
  bool _initialized = false;

  StorageManager();

  saveToStorage(String text) {
    storage.setItem('text', text);
  }

  clearStorage() async {
    await storage.clear();
  }

  Future<bool> isReady() {
    return storage.ready;
  }

  getValueFromStorage(var key) {
    return storage.getItem(key);
  }

  bool get initialized => _initialized;

  set setInitialized(bool value) {
    _initialized = value;
  }
}
