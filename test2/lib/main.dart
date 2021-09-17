import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'button_template.dart';
import 'modules/text_label_provider.dart';

void main() {
  runApp(ChangeNotifierProvider<TextLabel>(
      create: (contect) => TextLabel("text"), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Test task'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var providerItem = Provider.of<TextLabel>(context, listen: true);
    String providerText = providerItem.text;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
            future: providerItem.store.isReady(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  // ignore: prefer_const_constructors
                  child: CircularProgressIndicator(),
                );
              }

              if (!providerItem.store.initialized) {
                String? textLabelStart =
                    providerItem.store.getValueFromStorage("text");
                if (textLabelStart != null) {
                  providerText = textLabelStart;
                }
                providerItem.store.setInitialized = true;
              }

              return Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            providerText,
                            style: const TextStyle(fontSize: 36),
                          ))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Row(children: [
                        ButtonTemplate(
                          title: "apple",
                          buttonAction: () => providerItem.textLabel = "apple",
                        ),
                        ButtonTemplate(
                            title: "orange",
                            buttonAction: () =>
                                providerItem.textLabel = "orange"),
                        ButtonTemplate(
                            title: "banana",
                            buttonAction: () =>
                                providerItem.textLabel = "banana"),
                        ButtonTemplate(
                            title: "clear storage",
                            buttonAction: () =>
                                providerItem.store.clearStorage()),
                      ]))
                ],
              );
            },
          )),
    );
  }
}
