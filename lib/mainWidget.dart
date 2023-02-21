import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/statefulWrapper.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text("Flutter Widgets"),
      ),
      body: const Center(
        child: Text("Accessing stateful functionality with stateless widget"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => DummyClass())),
          child: const Center(child: Icon(Icons.navigate_next))),
    );
  }
}

// ignore: must_be_immutable
class DummyClass extends StatelessWidget {
  ValueNotifier<int> buttonClickedTimes = ValueNotifier(0);
  DummyClass({super.key});

  @override
  Widget build(BuildContext context) {
    print("Build Called");
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          buttonClickedTimes.value = buttonClickedTimes.value + 1;
          print("counter ${buttonClickedTimes.value}");
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Dummy Class"),
      ),
      body: StatefulWrapper(
          onInit: () {
            print("Dummy Init");
          },
          onDespose: () {
            print("Dummy despose");
          },
          child: Center(
              child: ValueListenableBuilder(
            valueListenable: buttonClickedTimes,
            builder: (context, value, child) {
              return Text("Total Click $value");
            },
          ))),
    );
  }
}
