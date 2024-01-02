import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter'),),
      body: Center(
        child: Text('Counter Value => $counter',
        style: const TextStyle(fontSize: 22,color: Colors.deepOrange),),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "inc",
            onPressed: () {
              setState(() {
                ++counter;
              });
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 8,),
          FloatingActionButton(
            heroTag: "dec",
            onPressed: () {
              setState(() {
                --counter;
              });
            },
            child: Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
