import 'package:flutter/material.dart';
import 'package:rxtdart/rxdart/rx_counter.dart';

class exampleScreen extends StatefulWidget {
  const exampleScreen({super.key});

  @override
  State<exampleScreen> createState() => _exampleScreenState();
}

class _exampleScreenState extends State<exampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: StreamBuilder(
            stream: Counter().stream,
            builder: (context, snapshot) {
              MyModel model = snapshot.data as MyModel;
              return Column(
                children: [
                  Text("A ${model.a} + ${model.b}"),
                ],
              );
            }),
      ),
    );
  }
}
