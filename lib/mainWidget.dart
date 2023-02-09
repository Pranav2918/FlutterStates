import 'package:flutter/material.dart';
import 'package:flutter_widgets/statefulWrapper.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () {
        print("Init Called");
      },
      onDespose: () {
        print("Dispose Called");
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: const Text("Flutter Widgets"),
        ),
        body: const Center(
          child: Text("Accessing stateful functionality with stateless widget"),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const DummyClass())),
            child: const Center(child: Icon(Icons.navigate_next))),
      ),
    );
  }
}

class DummyClass extends StatelessWidget {
  const DummyClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dummy Class"),
      ),
      body: StatefulWrapper(onInit: () {
        print("Dummy init");
      }, onDespose: () {
        print("Dummy despose");
      }, child: StatefulBuilder(builder: (context, update) {
        return GestureDetector(
            onTap: () {
              print("setState called");
              update(() {});
            },
            child: const Text("Dummy"));
      })),
    );
  }
}
