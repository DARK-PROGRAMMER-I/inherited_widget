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
  TextEditingController valueController = TextEditingController();
  incrementCounter(){

    setState(() {
      counter = counter + 1;
    });
  }
  clearCounter(){
    setState(() {
      counter= 0;
    });
  }
  setCounterValue(){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: TextFormField(
              validator: (val) => val != int ?  'Please Inter Integer value' : null,
              controller: valueController,
            ),
            actions: [
              ElevatedButton(onPressed: (){
                setState(() {
                 counter = int.parse(valueController.text);
                });
                Navigator.pop(context);
              }, child: Text('Save'))
            ],

          );
        }
    );
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