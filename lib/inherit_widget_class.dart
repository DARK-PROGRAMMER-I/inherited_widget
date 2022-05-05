import 'package:flutter/material.dart';

class ChangeState extends StatefulWidget {
  final Widget child;

  ChangeState({
    Key? key,
    required this.child,
}): super(key: key);

  @override
  _ChangeStateState createState() => _ChangeStateState();
}

class _ChangeStateState extends State<ChangeState> {
  int counter = 0;

  incrementCounter(){

    setState(() {
      counter = counter + 1;
    });
  }

  @override
  Widget build(BuildContext context)  =>
      Inherit(
          child: widget.child,
          counter: counter,
          stateChange: this,
      );
}



class Inherit extends InheritedWidget{
  final int counter;
  final _ChangeStateState stateChange;
  Inherit({
      Key? key,
      required Widget child,
      required this.counter,
      required this.stateChange,

    }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(Inherit oldWidget) => counter != oldWidget.counter;

  static _ChangeStateState? of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<Inherit>()?.stateChange;

}