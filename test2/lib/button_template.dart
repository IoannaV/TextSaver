import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modules/text_label_provider.dart';

class ButtonTemplate extends StatefulWidget {
  final String title;
  final buttonAction;
  ButtonTemplate({Key? key, required this.title, required this.buttonAction})
      : super(key: key);

  @override
  _ButtonTemplateState createState() => _ButtonTemplateState();
}

class _ButtonTemplateState extends State<ButtonTemplate> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            color: _pressed ? Colors.blue[200] : Colors.blue[100],
            height: 50,
            width: 100,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                widget.title,
                style: const TextStyle(color: Colors.black87),
              ),
            ),
          ),
        ),
        onTapUp: (details) => setState(() => _pressed = false),
        onTapDown: (details) => setState(() {
              widget.buttonAction();
              _pressed = true;
            }),
        onTapCancel: () => setState(() => _pressed = false));
  }
}
