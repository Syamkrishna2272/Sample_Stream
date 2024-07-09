import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  StreamController<String> streamController = StreamController<String>();
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Center(child: Text("Sample Stream")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<String>(
                stream: streamController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data ?? 'Null data',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                    );
                  } else {
                    return const Text(
                      "NoData",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                    );
                  }
                }),
            const SizedBox(
              height: 20,
            ),
             SizedBox(width: 150, child: TextField(
              controller: textEditingController,
            )),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  streamController.add(textEditingController.text);
                },
                child: const Text("Done"))
          ],
        ),
      ),
    );
  }
}
