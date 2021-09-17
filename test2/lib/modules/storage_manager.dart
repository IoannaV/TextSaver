import 'package:localstorage/localstorage.dart';

class StorageManager {
  final LocalStorage storage = LocalStorage('text_store'); //TODO: add path
  bool _initialized = false;
  late String textlabel = "tttttttt";

  StorageManager();

  saveToStorage(String text) {
    storage.setItem('text', text);
    print("save");
  }

  clearStorage() async {
    await storage.clear();
    print("delete");
  }

  Future<bool> isReady() {
    return storage.ready;
  }

  getValueFromStorage(var key) {
    return storage.getItem(key);
  }

  bool get initialized => _initialized;

  void setInitialized(bool value) {
    _initialized = value;
  }
}
