import 'package:flutter/material.dart';
import 'package:rxtdart/ui/defenation_screen/defination_screen.dart';
import 'package:rxtdart/validator/counter_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const DefinationScreen();
                  },
                ));
              },
              icon: const Icon(
                Icons.description,
                size: 30,
                color: Colors.black,
              ),
              label: const Text('describtion_screen')),
          TextButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const CounterScreen();
                  },
                ));
              },
              icon: const Icon(
                Icons.countertops,
                size: 30,
                color: Colors.black,
              ),
              label: const Text('Counter Screen'))
        ],
      ),
    );
  }
}
