import 'package:flutter/cupertino.dart';

import 'storage_manager.dart';

class TextLabel extends ChangeNotifier {
  String _textlabel = "text";
  StorageManager store = StorageManager();

  TextLabel(this._textlabel);

  String get text => _textlabel;

  set textLabel(String textlabel) {
    _textlabel = textlabel;
    store.saveToStorage(_textlabel);
    notifyListeners();
  }
}
