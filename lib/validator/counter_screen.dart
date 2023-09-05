import 'package:flutter/material.dart';
import 'package:rxtdart/rxdart/rx_counter.dart';
import 'package:rxtdart/ui/example_screen.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const exampleScreen();
                  },
                ));
              },
              icon: const Icon(
                Icons.next_plan,
                size: 30,
                color: Colors.black,
              ),
              label: const Text('next plan'))
        ],
      ),
      body: Center(
        child: StreamBuilder(
            stream: Counter().stream,
            builder: (context, snapshot) {
              MyModel model = snapshot.data as MyModel;
              return Column(
                children: [
                  Text("A ${model.a} + B ${model.b}"),
                  ElevatedButton(
                    child: const Text('press'),
                    onPressed: () {
                      Counter().increment();
                    },
                  )
                ],
              );
            }),
      ),
    );
  }
}
