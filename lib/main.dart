import 'package:flutter/material.dart';
import 'package:inherited_widget/inherit_widget_class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  ChangeState(
          child: MyHomePage(title: 'Flutter Demo Home Page')),
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


  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }
  TextEditingController valueController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _counter = Inherit.of(context)?.counter;
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){
                    Inherit.of(context)?.incrementCounter();
                  },
                  child: Text('Press me', style: TextStyle(fontSize: 16),),
                ),
                SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: (){
                    Inherit.of(context)?.clearCounter();
                  },
                  child: Text('Clear Counter', style: TextStyle(fontSize: 16),),
                ),
                SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: (){
                    Inherit.of(context)?.setCounterValue();
                  },
                  child: Text('Set Value', style: TextStyle(fontSize: 16),),
                )
              ],
            )
          ],
        ),
      ),

    );
  }
}
