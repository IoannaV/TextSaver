import 'package:flutter/cupertino.dart';

import 'storage_manager.dart';

class TextLabel extends ChangeNotifier {
  String _textlabel = "text";
  StorageManager store = StorageManager();
//saver new a potom call method
  TextLabel(this._textlabel);

  String get text => _textlabel;

  void setTextLabel(String textlabel) {
    _textlabel = textlabel;
    store.saveToStorage(_textlabel);
    notifyListeners();
  }

  void saveTextLabel() {}
}
