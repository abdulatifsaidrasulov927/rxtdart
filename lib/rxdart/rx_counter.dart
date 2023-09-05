import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class Counter {
  Counter._();
  static final _instance = Counter._();
  factory Counter() {
    return _instance;
  }

  final BehaviorSubject _counter =
      BehaviorSubject.seeded(MyModel(a: 10, b: 20));

  get stream => _counter.stream;

  MyModel get current => _counter.value;

  TextEditingController nuber1 = TextEditingController();
  TextEditingController nuber2 = TextEditingController();

  increment() {
    int c = current.a;
    int d = current.b;
    _counter.add(MyModel(a: c + 1, b: d + 1));
  }

  // Observable
}

class MyModel {
  MyModel({required this.a, required this.b});

  int a;
  int b;
}
