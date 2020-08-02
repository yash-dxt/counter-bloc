import 'dart:async';

import 'package:flutter/material.dart';

class CounterBloc {
  final _countStream = StreamController<int>();

  Stream<int> get count => _countStream.stream;

  Function(int) get changeCount => _countStream.sink.add;

  void dispose() {
    _countStream.close();
  }
}
