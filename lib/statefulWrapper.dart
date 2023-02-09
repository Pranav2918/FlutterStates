import 'package:flutter/material.dart';

class StatefulWrapper extends StatefulWidget {
  final Function onInit;
  final Function onDespose;
  final Widget child;
  const StatefulWrapper(
      {super.key, required this.onInit, required this.onDespose, required this.child});

  @override
  State<StatefulWrapper> createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<StatefulWrapper> {
  @override
  void initState() {
    // ignore: unnecessary_null_comparison
    if (widget.onInit != null) {
      widget.onInit();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    if (widget.onDespose != null) {
      widget.onDespose();
    }
    super.dispose();
  }
}
